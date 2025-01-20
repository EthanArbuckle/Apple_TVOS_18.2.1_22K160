void sub_1002F16C4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void v6[4];
  id v7;
  id v8;
  v3 = *(void *)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT * FROM %@",  v3));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002F1788;
  v6[3] = &unk_1003F2588;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  sub_1001D64E8((uint64_t)v4, v5, v6);
}

void sub_1002F1788(uint64_t a1, uint64_t a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F180C;
  v4[3] = &unk_1003F02B0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  sub_1001BF214(a2, v4);
}

void sub_1002F180C(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = sub_1002E73E4(v3, *(void **)(a1 + 32));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle_id"]);
  if (v7)
  {
    uint64_t v46 = 0LL;
    v8 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v7,  0LL,  &v46);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"update_state"]);
      v10 = (char *)[v9 integerValue];

      if ((unint64_t)(v10 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      {

        v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle_id"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, @"bundle_id");

        v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"is_background"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v20,  @"is_background");

        v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"is_offloaded"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v21,  @"is_offloaded");

        v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"is_per_device"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v22,  @"is_per_device");

        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"purchase_id"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v23,  @"purchase_id");

        v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"store_item_id"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v24,  @"store_item_id");

        v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"store_software_version_id"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v25,  @"store_software_version_id");

        v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"update_state"]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v26,  @"update_state");

        id v27 = sub_1002E72CC((uint64_t)v3, @"install_date");
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v29 = v28;
        if (v28)
        {
          [v28 doubleValue];
          v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v30,  @"install_date");
        }

        id v31 = sub_1002E72CC((uint64_t)v3, @"release_date");
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

        if (v32)
        {
          [v32 doubleValue];
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v33,  @"release_date");
        }

        id v34 = sub_1002E72CC((uint64_t)v3, @"timestamp");
        v8 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue(v34);

        if (v8)
        {
          -[LSApplicationRecord doubleValue](v8, "doubleValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v35,  @"timestamp");
        }

        id v36 = sub_1002E71DC((uint64_t)v3, @"metrics_data");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v37,  0LL,  0LL));
          if (v38) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v38,  @"metrics_data");
          }
        }

        id v39 = sub_1002E71DC((uint64_t)v3, @"store_item_data");
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v40,  0LL,  0LL));
          if (v41) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v41,  @"store_item_data");
          }
        }

        v42 = *(void **)(a1 + 40);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_1002F1DC8;
        v43[3] = &unk_1003EDC90;
        id v44 = v7;
        v45 = v4;
        [v42 modifyUsingTransaction:v43];

        goto LABEL_26;
      }

      uint64_t v11 = ASDLogHandleForCategory(17LL);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v7;
        v13 = "Skipping transported update where pending: %{public}@";
        v14 = v12;
        uint32_t v15 = 12;
LABEL_29:
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }

    else
    {
      uint64_t v18 = ASDLogHandleForCategory(17LL);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v48 = v7;
        __int16 v49 = 2114;
        uint64_t v50 = v46;
        v13 = "Skipping transported update where uninstalled or demoted: %{public}@ %{public}@";
        v14 = v12;
        uint32_t v15 = 22;
        goto LABEL_29;
      }
    }

LABEL_26:
    goto LABEL_27;
  }

  uint64_t v16 = ASDLogHandleForCategory(17LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Skipping transported update with no bundle identifier",  buf,  2u);
  }

LABEL_27:
}

id sub_1002F1DC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  *(void *)(a1 + 32)));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
  id v6 = sub_10024C088((uint64_t)&OBJC_CLASS___AppUpdateEntity, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    uint64_t v8 = ASDLogHandleForCategory(17LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v21 = 138543362;
      uint64_t v22 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unable to transport update with known bundle identifier: %{public}@",  (uint8_t *)&v21,  0xCu);
    }

    id v10 = 0LL;
  }

  else
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___AppUpdateEntity);
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
    v9 = -[SQLiteEntity initWithPropertyValues:onConnection:](v11, "initWithPropertyValues:onConnection:", v12, v13);

    id v10 = -[os_log_s existsInDatabase](v9, "existsInDatabase");
    uint64_t v14 = ASDLogHandleForCategory(17LL);
    uint32_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = v15;
    if ((_DWORD)v10)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v21 = 138543362;
        uint64_t v22 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Sucessfully transported update for: %{public}@",  (uint8_t *)&v21,  0xCu);
      }
    }

    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      int v21 = 138543362;
      uint64_t v22 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to transport update for: %{public}@",  (uint8_t *)&v21,  0xCu);
    }
  }

  return v10;
}

id *sub_1002F2054(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_CLASS___SwitchAppOwnerTask;
    uint64_t v11 = (id *)objc_msgSendSuper2(&v15, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 5, a2);
      objc_storeStrong(a1 + 6, a3);
      objc_storeStrong(a1 + 8, a4);
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
      id v13 = a1[7];
      a1[7] = v12;
    }
  }

  return a1;
}

LABEL_90:
      v133 = (void *)objc_claimAutoreleasedReturnValue([v113 objectForKeyedSubscript:@"replacementReceipt"]);
      if (v133)
      {
        v134 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v133,  0LL);
        v135 = sub_1002F36C0((uint64_t)self, self->_fromUserName, v134);
        v136 = ASDLogHandleForCategory(28LL);
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          v138 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
          *(_DWORD *)buf = 138543618;
          v185 = v138;
          v186 = 1024;
          *(_DWORD *)v187 = v135;
          _os_log_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Replaced receipt on app with bundleID: %{public}@ result: %d",  buf,  0x12u);
        }
      }

      v139 = (void *)objc_claimAutoreleasedReturnValue(-[NSString storeMetadata](self->_fromUserName, "storeMetadata"));
      v119 = v139;
      if (v139)
      {
        sub_1003042C8(v139, *(void **)&self->super._success);
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
        [v119 setPurchaserID:v140];

        v141 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
        v142 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleURL](self->_fromUserName, "bundleURL"));
        v183 = v125;
        v143 = sub_10030456C(v119, v141, (uint64_t)v142, &v183);
        v114 = v183;

        if (v143)
        {
          v144 = ASDLogHandleForCategory(28LL);
          v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
          if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
          {
            v146 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
            v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
            *(_DWORD *)buf = 138543618;
            v185 = v146;
            v186 = 2114;
            *(void *)v187 = v147;
            _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Updated metadata for bundleID: %{public}@ to account: %{public}@",  buf,  0x16u);
          }

          v148 = objc_claimAutoreleasedReturnValue( -[NSString canonicalExecutablePath]( self->_fromUserName, "canonicalExecutablePath"));
          [v148 fileSystemRepresentation];
          v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
          [v149 longLongValue];
          sub_100128300();
          v151 = v150;

          v152 = ASDLogHandleForCategory(28LL);
          v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
          v153 = os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT);
          if (v151)
          {
            if (v153)
            {
              v154 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
              *(_DWORD *)buf = 138543618;
              v185 = v154;
              v186 = 2048;
              *(void *)v187 = v151;
              _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: App with bundleID: %{public}@ not launchable following SINF update. Launch status: %ld",  buf,  0x16u);
            }

            v129 = 0;
          }

          else
          {
            if (v153)
            {
              v158 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
              v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
              *(_DWORD *)buf = 138543618;
              v185 = v158;
              v186 = 2114;
              *(void *)v187 = v159;
              _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: App with bundleID: %{public}@ launchable with account: %{public}@",  buf,  0x16u);
            }

            v129 = 1;
          }

          id v6 = v179;
LABEL_119:

          v125 = v114;
          goto LABEL_120;
        }

        v129 = 0;
        v125 = v114;
        id v6 = v179;
      }

      else
      {
        v129 = 1;
      }

LABEL_120:
      goto LABEL_121;
    }

    id v6 = v179;
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSString bundleID](self->_fromUserName, "bundleID"));
      *(_DWORD *)buf = 138543618;
      v185 = v132;
      v186 = 1024;
      *(_DWORD *)v187 = v124;
      _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]:Replaced SINF on app with bundleID: %{public}@ result: %d",  buf,  0x12u);
    }

    if (v124) {
      goto LABEL_90;
    }
    v114 = 0LL;
  }

  v129 = 0;
LABEL_122:
  buf[0] = v129;

LABEL_131:
  v165 = buf[0];
  objc_setProperty_atomic_copy(self, v160, newValue, 32LL);
  LOBYTE(self->super._keepAlive) = v165;
}

uint64_t sub_1002F36C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_1002E6898((uint64_t)&OBJC_CLASS___WriteReceipt, v6, v5, *(void **)(a1 + 56), 0LL);
  uint64_t v8 = ASDLogHandleForCategory(28LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
    int v13 = 138543362;
    uint64_t v14 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[SwitchArcade]: Receipt fresh failed for bundleID: %{public}@",  (uint8_t *)&v13,  0xCu);
    goto LABEL_4;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
    int v13 = 138543362;
    uint64_t v14 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[SwitchArcade]: Receipt fresh succeeded for bundleID: %{public}@",  (uint8_t *)&v13,  0xCu);
LABEL_4:
  }

void sub_1002F3980(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  id v5 = sub_1001E1834((uint64_t)&OBJC_CLASS___DeviceStateMonitor);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (!v6)
  {
    uint64_t v19 = ASDLogHandleForCategory(14LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138543362;
    id v46 = (id)objc_opt_class(v4, v20);
    id v17 = v46;
    uint64_t v18 = "[%{public}@]: Not prompting during device setup";
    goto LABEL_12;
  }

  if (!v3 || ![v3 count])
  {
    uint64_t v15 = ASDLogHandleForCategory(14LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138543362;
    id v46 = (id)objc_opt_class(v4, v16);
    id v17 = v46;
    uint64_t v18 = "[%{public}@]: No bundle ids";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

    goto LABEL_20;
  }

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
  if (!v7)
  {
    uint64_t v21 = ASDLogHandleForCategory(14LL);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = (id)objc_opt_class(v4, v23);
      id v24 = v46;
    }

    goto LABEL_19;
  }

  uint64_t v8 = objc_opt_self(v4);
  id v9 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_1002564A0(v10, @"use-alternate-text-for-manage-subs-on-app-delete");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueWithError:0]);

  if (v13)
  {
    if ([v13 BOOLValue])
    {
LABEL_7:

      char v14 = 1;
LABEL_18:
      id v32 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1002F3D54;
      v39[3] = &unk_1003F25D8;
      v40 = (os_log_s *)v3;
      uint64_t v42 = v4;
      char v43 = v14;
      v41 = v7;
      sub_100256A34(v33, @"manage-subs-app-delete-skip-list", 0, v39);

      uint64_t v22 = v40;
LABEL_19:

      goto LABEL_20;
    }

void sub_1002F3D54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:AMSErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)204) {
        goto LABEL_4;
      }
    }

    else
    {
    }

    CFPropertyListRef v11 = sub_1002FA020((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

    id v5 = (id)v12;
    if (!v12) {
      goto LABEL_43;
    }
    goto LABEL_10;
  }

id sub_1002F4444(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  id v5 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v35 = 0LL;
  id v7 = sub_100255BF0((uint64_t)v6, (uint64_t)@"hideableSystemApps", &v35);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v35;

  if (v9)
  {
    uint64_t v10 = ASDLogHandleForCategory(14LL);
    CFPropertyListRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (void *)objc_opt_class(v4, v12);
      *(_DWORD *)buf = 138543874;
      id v38 = v25;
      __int16 v39 = 2114;
      id v40 = v3;
      __int16 v41 = 2114;
      id v42 = v9;
      id v26 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Error reading bag finding adam ID for: %{public}@, error: %{public}@",  buf,  0x20u);
    }

    id v13 = 0LL;
  }

  else
  {
    uint64_t v29 = v4;
    id v30 = v8;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    CFPropertyListRef v11 = v8;
    id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", @"bundle-id", v29));
          unsigned __int8 v20 = [v19 isEqualToString:v3];

          if ((v20 & 1) != 0)
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"id"]);
            id v13 = [v23 longLongValue];

            goto LABEL_17;
          }
        }

        id v15 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v21 = ASDLogHandleForCategory(14LL);
    CFPropertyListRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v27 = (void *)objc_opt_class(v29, v22);
      *(_DWORD *)buf = 138543618;
      id v38 = v27;
      __int16 v39 = 2114;
      id v40 = v3;
      id v28 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[%{public}@]: No adam ID in bag for %{public}@",  buf,  0x16u);
    }

    id v13 = 0LL;
LABEL_17:
    uint64_t v8 = v30;
  }

  return v13;
}

os_log_s *sub_1002F4708(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  uint64_t v19 = 0LL;
  id v5 = -[LSApplicationRecord initWithBundleIdentifierOfSystemPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifierOfSystemPlaceholder:error:",  v3,  &v19);
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = ASDLogHandleForCategory(14LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      CFPropertyListRef v11 = (void *)objc_opt_class(v4, v10);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v3;
      __int16 v24 = 2114;
      uint64_t v25 = v19;
      id v12 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[%{public}@]: No app record for %{public}@: %{public}@",  buf,  0x20u);
    }

    goto LABEL_9;
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](v5, "localizedName"));
  if (!-[os_log_s length](v7, "length"))
  {
    uint64_t v13 = ASDLogHandleForCategory(14LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (void *)objc_opt_class(v4, v15);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      id v23 = v3;
      id v18 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Proxy missing name for %{public}@",  buf,  0x16u);
    }

LABEL_9:
    uint64_t v8 = 0LL;
    goto LABEL_10;
  }

  id v7 = v7;
  uint64_t v8 = v7;
LABEL_10:

  return v8;
}

void sub_1002F48D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:ICErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)-7008LL)
      {
        uint64_t v10 = ASDLogHandleForCategory(14LL);
        CFPropertyListRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = (void *)objc_opt_class(*(void *)(a1 + 32), v12);
          int v45 = 138543618;
          id v46 = v13;
          __int16 v47 = 2114;
          id v48 = @"com.apple.Music";
          id v14 = v13;
          uint64_t v15 = "[%{public}@]: No cached subscription info for %{public}@";
          uint64_t v16 = v11;
          uint32_t v17 = 22;
LABEL_22:
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v45, v17);
          goto LABEL_23;
        }

        goto LABEL_15;
      }
    }

    else
    {
    }

    uint64_t v36 = ASDLogHandleForCategory(14LL);
    CFPropertyListRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = (void *)objc_opt_class(*(void *)(a1 + 32), v37);
      int v45 = 138543874;
      id v46 = v44;
      __int16 v47 = 2114;
      id v48 = @"com.apple.Music";
      __int16 v49 = 2114;
      id v50 = v7;
      id v14 = v44;
      uint64_t v15 = "[%{public}@]: Error getting subscription info for %{public}@, %{public}@";
      uint64_t v16 = v11;
      uint32_t v17 = 32;
      goto LABEL_22;
    }

void sub_1002F4D0C(uint64_t a1, void *a2, uint64_t a3, void *a4, int a5)
{
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = objc_opt_self(a1);
  uint64_t v12 = ASDLogHandleForCategory(14LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = (id)objc_opt_class(v11, v14);
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    id v15 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Prompting single for %lld",  buf,  0x16u);
  }

  uint64_t v16 = ASDLocalizedString(@"MANAGE_SUBS_ON_DELETE_TITLE");
  uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateStyle:](v18, "setDateStyle:", 2LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v18, "stringFromDate:", v10));

  if (a5) {
    uint64_t v20 = @"MANAGE_SUBS_ON_DELETE_MESSAGE_AUTO_RENEWAL_DISALLOWED";
  }
  else {
    uint64_t v20 = @"MANAGE_SUBS_ON_DELETE_MESSAGE";
  }
  uint64_t v21 = ASDLocalizedString(v20);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v9, v19));

  uint64_t v24 = ASDLocalizedString(@"MANAGE_SUBS_ON_DELETE_MANAGE_BUTTON");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = ASDLocalizedString(@"MANAGE_SUBS_ON_DELETE_KEEP_BUTTON");
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  sub_1002F5FFC(v11, v17, v23, v25, v27, a3);
}

void sub_1002F4F04(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  if (v8)
  {
    uint64_t v9 = ASDLogHandleForCategory(14LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    __int16 v47 = (void *)objc_opt_class(*(void *)(a1 + 32), v11);
    *(_DWORD *)buf = 138543874;
    id v58 = v47;
    __int16 v59 = 2114;
    id v60 = @"com.apple.news";
    __int16 v61 = 2114;
    id v62 = v8;
    id v43 = v47;
    uint64_t v44 = "[%{public}@]: Error getting subscription info for %{public}@, %{public}@";
    int v45 = v10;
    uint32_t v46 = 32;
LABEL_31:
    _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);

    goto LABEL_3;
  }

  if (![v7 count])
  {
    uint64_t v40 = ASDLogHandleForCategory(14LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v42 = (void *)objc_opt_class(*(void *)(a1 + 32), v41);
    *(_DWORD *)buf = 138543618;
    id v58 = v42;
    __int16 v59 = 2114;
    id v60 = @"com.apple.news";
    id v43 = v42;
    uint64_t v44 = "[%{public}@]: No entitlements for %{public}@";
    int v45 = v10;
    uint32_t v46 = 22;
    goto LABEL_31;
  }

  if ([v7 count])
  {
    uint64_t v12 = ASDLogHandleForCategory(14LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_opt_class(*(void *)(a1 + 32), v14);
      *(_DWORD *)buf = 138543618;
      id v58 = v15;
      __int16 v59 = 2114;
      id v60 = @"com.apple.news";
      id v16 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Found subscription info for %{public}@",  buf,  0x16u);
    }

    uint32_t v17 = sub_1002F4708(*(void *)(a1 + 32), @"com.apple.news");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (v10)
    {
      id v18 = sub_1002F4444(*(void *)(a1 + 32), @"com.apple.news");
      if (v18)
      {
        uint64_t v48 = (uint64_t)v18;
        __int16 v49 = v10;
        uint64_t v19 = a1;
        v51 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        id v50 = v7;
        id v21 = v7;
        id v22 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (!v22) {
          goto LABEL_26;
        }
        id v23 = v22;
        uint64_t v24 = *(void *)v53;
        while (1)
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v53 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
            uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 expiryDate]);
            if (v27)
            {
              id v28 = (void *)v27;
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 expiryDate]);
              if ([v29 compare:v20] == (id)1)
              {
                unsigned int v30 = [v26 autoRenewEnabled];

                if (v30)
                {
                  -[NSMutableArray addObject:](v51, "addObject:", v26);
                  continue;
                }
              }

              else
              {
              }
            }

            uint64_t v31 = ASDLogHandleForCategory(14LL);
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v34 = (void *)objc_opt_class(*(void *)(v19 + 32), v33);
              *(_DWORD *)buf = 138543618;
              id v58 = v34;
              __int16 v59 = 2114;
              id v60 = @"com.apple.news";
              id v35 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Filtering an entitlement for %{public}@",  buf,  0x16u);
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (!v23)
          {
LABEL_26:

            if (-[NSMutableArray count](v51, "count") == (id)1)
            {
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v51, "objectAtIndexedSubscript:", 0LL));
              uint64_t v37 = *(void *)(v19 + 32);
              id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 expiryDate]);
              uint64_t v39 = v37;
              id v10 = v49;
              sub_1002F4D0C(v39, v49, v48, v38, *(unsigned __int8 *)(v19 + 40));

              id v8 = 0LL;
            }

            else
            {
              id v10 = v49;
              id v8 = 0LL;
            }

            id v7 = v50;
            break;
          }
        }
      }
    }

void sub_1002F539C(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7 = a2;
  uint64_t v8 = objc_opt_self(a1);
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = (id)objc_opt_class(v8, v11);
    __int16 v25 = 2048;
    uint64_t v26 = a3;
    id v12 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Prompting multiple for %lld",  buf,  0x16u);
  }

  uint64_t v13 = ASDLocalizedString(@"MANAGE_SUBS_ON_DELETE_TITLE_PLURAL");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (a4) {
    id v15 = @"MANAGE_SUBS_ON_DELETE_MESSAGE_PLURAL_AUTO_RENEWAL_DISALLOWED";
  }
  else {
    id v15 = @"MANAGE_SUBS_ON_DELETE_MESSAGE_PLURAL";
  }
  uint64_t v16 = ASDLocalizedString(v15);
  uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v7));

  uint64_t v19 = ASDLocalizedString(@"MANAGE_SUBS_ON_DELETE_MANAGE_BUTTON_PLURAL");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = ASDLocalizedString(@"MANAGE_SUBS_ON_DELETE_KEEP_BUTTON_PLURAL");
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  sub_1002F5FFC(v8, v14, v18, v20, v22, a3);
}

void sub_1002F5548(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(14LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_opt_class(*(void *)(a1 + 40), v6);
    id v8 = v7;
    *(_DWORD *)buf = 138543874;
    id v18 = v7;
    __int16 v19 = 2048;
    id v20 = [v3 count];
    __int16 v21 = 2114;
    id v22 = @"com.apple.tv";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Found %li IAPs for bundle ID: %{public}@",  buf,  0x20u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002F5714;
  v16[3] = &unk_1003F2638;
  v16[4] = *(void *)(a1 + 40);
  id v9 = sub_1002B87DC(v3, v16);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ([v10 count] == (id)1)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 expirationDate]);
    sub_1002F4D0C(v12, v13, v14, v15, *(unsigned __int8 *)(a1 + 56));
  }

  else if ((unint64_t)[v10 count] >= 2)
  {
    sub_1002F539C(*(void *)(a1 + 40), *(void **)(a1 + 32), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }
}

id sub_1002F5714(uint64_t a1, void *a2)
{
  return sub_1002F571C(*(void *)(a1 + 32), a2);
}

id sub_1002F571C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  if ([v3 type] == 3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      if ([v5 compare:v6] == (id)1) {
        id v7 = [v3 autoRenewStatus];
      }
      else {
        id v7 = 0LL;
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void sub_1002F57EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(14LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_opt_class(*(void *)(a1 + 40), v6);
    id v8 = v7;
    id v9 = [v3 count];
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v7;
    __int16 v38 = 2048;
    id v39 = v9;
    __int16 v40 = 2114;
    uint64_t v41 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Found %li apps for bundle IDs %{public}@",  buf,  0x20u);
  }

  if (v3 && [v3 count])
  {
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v12 = v3;
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint32_t v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 storeItemID]));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, v18);
        }

        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v14);
    }

    id v19 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v11, "allKeys"));
    id v22 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 1);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1002F5A94;
    v26[3] = &unk_1003F25D8;
    id v24 = *(void **)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 40);
    id v27 = v24;
    id v28 = v11;
    char v30 = *(_BYTE *)(a1 + 48);
    __int16 v25 = v11;
    sub_10029C9D8((uint64_t)v20, v21, v23, v26);
  }
}

void sub_1002F5A94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(14LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_opt_class(*(void *)(a1 + 48), v6);
    id v8 = v7;
    id v9 = [v3 count];
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    char v67 = v7;
    __int16 v68 = 2048;
    id v69 = v9;
    __int16 v70 = 2114;
    *(void *)__int128 v71 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Found %li IAPs for bundle IDs %{public}@",  buf,  0x20u);
  }

  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v12 = v3;
  v51 = v12;
  id v55 = [v12 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v55)
  {
    uint64_t v14 = *(void *)v62;
    *(void *)&__int128 v13 = 138544386LL;
    __int128 v50 = v13;
    do
    {
      for (i = 0LL; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        unsigned int v17 = sub_1002F571C(*(void *)(a1 + 48), v16);
        uint64_t v18 = ASDLogHandleForCategory(14LL);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v20)
          {
            id v22 = (void *)objc_opt_class(*(void *)(a1 + 48), v21);
            id v23 = v22;
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 adamId]);
            *(_DWORD *)buf = 138543618;
            char v67 = v22;
            __int16 v68 = 2114;
            id v69 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Promptable IAP: %{public}@",  buf,  0x16u);
          }

          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v16 appAdamId]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v25));

          if (v26)
          {
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v16 appAdamId]);
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v27));

            -[os_log_s addObject:](v19, "addObject:", v16);
          }

          else
          {
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  v16));
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v16 appAdamId]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v19, v35);
          }
        }

        else if (v20)
        {
          id v28 = (void *)objc_opt_class(*(void *)(a1 + 48), v21);
          id v53 = v28;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v16 adamId]);
          unsigned int v30 = [v16 type];
          __int128 v31 = v11;
          uint64_t v32 = v14;
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v16 expirationDate]);
          unsigned int v34 = [v16 autoRenewStatus];
          *(_DWORD *)buf = v50;
          char v67 = v28;
          __int16 v68 = 2114;
          id v69 = v29;
          __int16 v70 = 1024;
          *(_DWORD *)__int128 v71 = v30;
          id v12 = v51;
          *(_WORD *)&v71[4] = 2114;
          *(void *)&v71[6] = v33;
          __int16 v72 = 1024;
          unsigned int v73 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Not prompting for IAP: %{public}@, type: %hhu, expiration date: %{public}@, auto-renew: %i",  buf,  0x2Cu);

          uint64_t v14 = v32;
          uint64_t v11 = v31;
        }
      }

      id v55 = [v12 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }

    while (v55);
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  char v56 = v11;
  obj = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v11, "allKeys"));
  id v36 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v40, v50));
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v40));
        if ([v42 count] == (id)1)
        {
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndexedSubscript:0]);
          uint64_t v54 = *(void *)(a1 + 48);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v41 longTitle]);
          id v45 = [v41 storeItemID];
          id v46 = v37;
          uint64_t v47 = v38;
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v43 expirationDate]);
          sub_1002F4D0C(v54, v44, (uint64_t)v45, v48, *(unsigned __int8 *)(a1 + 56));

          uint64_t v38 = v47;
          id v37 = v46;
        }

        else
        {
          uint64_t v49 = *(void *)(a1 + 48);
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v41 longTitle]);
          sub_1002F539C(v49, v43, (uint64_t)[v41 storeItemID], *(unsigned __int8 *)(a1 + 56));
        }
      }

      id v37 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }

    while (v37);
  }
}

void sub_1002F5FFC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = a2;
  objc_opt_self(a1);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=SUBSCRIPTIONS&app=%lld&ctx=appdelete",  a6));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));

  unsigned int v17 = -[AMSDialogRequest initWithTitle:message:]( objc_alloc(&OBJC_CLASS___AMSDialogRequest),  "initWithTitle:message:",  v14,  v13);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:style:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:style:",  v12,  0LL));

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:style:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:style:",  v11,  2LL));
  v26[0] = v18;
  v26[1] = v19;
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  -[AMSDialogRequest setButtonActions:](v17, "setButtonActions:", v20);

  -[AMSDialogRequest setDefaultAction:](v17, "setDefaultAction:", v19);
  sub_100321874(v17, @"manageSubscriptionsOnDelete");
  sub_1001D7974(v19, @"keep");
  sub_1001D7974(v18, @"manage");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1002F6220;
  v23[3] = &unk_1003EB190;
  id v24 = v18;
  id v25 = v16;
  id v21 = v16;
  id v22 = v18;
  sub_10027808C((uint64_t)&OBJC_CLASS___InteractiveRequestPresenter, v17, v23);
}

void sub_1002F6220(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 selectedActionIdentifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v6 openSensitiveURL:*(void *)(a1 + 40) withOptions:&__NSDictionary0__struct];
  }

id *sub_1002F6528(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___ApplicationProxy;
    unsigned int v5 = (id *)objc_msgSendSuper2(&v7, "init");
    a1 = v5;
    if (v5)
    {
      if (v4)
      {
        objc_storeStrong(v5 + 8, a2);
      }

      else
      {

        a1 = 0LL;
      }
    }
  }

  return a1;
}

id *sub_1002F75B4(id *a1)
{
  if (a1)
  {
    id v1 = sub_100325E80(a1[8]);
    a1 = (id *)objc_claimAutoreleasedReturnValue(v1);
  }

  return a1;
}

id sub_1002F7BEC(id a1, LSApplicationExtensionRecord *a2)
{
  return sub_1002EAD00(a2);
}

BOOL sub_1002F7FF0(id a1, LSApplicationRecord *a2)
{
  v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](v2, "bundleIdentifier"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](v2, "bundleIdentifier"));
    id v5 = [v4 length];

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](v2, "typeForInstallMachinery"));
      LOBYTE(v3) = [v6 isEqualToString:LSUserApplicationType];
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

BOOL sub_1002F8084(id a1, LSApplicationRecord *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](a2, "typeForInstallMachinery"));
  unsigned __int8 v3 = [v2 isEqualToString:LSSystemApplicationType];

  return v3;
}

BOOL sub_1002F80C8(id a1, LSApplicationRecord *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](a2, "typeForInstallMachinery"));
  unsigned __int8 v3 = [v2 isEqualToString:LSInternalApplicationType];

  return v3;
}

void sub_1002F810C(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned __int8 v3 = objc_autoreleasePoolPush();
  id v4 = sub_1002F6528((id *)objc_alloc(&OBJC_CLASS___ApplicationProxy), v5);
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  objc_autoreleasePoolPop(v3);
}

id sub_1002F856C(uint64_t a1)
{
  if (qword_1004626A0 != -1) {
    dispatch_once(&qword_1004626A0, &stru_1003F2770);
  }
  return (id)qword_100462698;
}

void sub_1002F85B0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___RepairService);
  v2 = (void *)qword_100462698;
  qword_100462698 = (uint64_t)v1;
}

void sub_1002F86C8(void **a1)
{
  v2 = sub_100206218((id *)objc_alloc(&OBJC_CLASS___RepairApplicationTask), a1[4], a1[5]);
  newValue[0] = _NSConcreteStackBlock;
  newValue[1] = 3221225472LL;
  newValue[2] = sub_1002F8788;
  newValue[3] = &unk_1003F2098;
  id v8 = a1[6];
  if (v2) {
    objc_setProperty_atomic_copy(v2, v3, newValue, 64LL);
  }
  id v4 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)v5;
  if (v5) {
    [*(id *)(v5 + 8) addOperation:v2];
  }
}

void sub_1002F8788(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = ASDErrorWithSafeUserInfo(a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a2, v7, v9);
}

void sub_1002F88B8(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v3 = ASDLogHandleForCategory(28LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processInfo]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    *(_DWORD *)buf = 138412546;
    id v21 = v2;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@] Processing keybag refresh for client: %{public}@",  buf,  0x16u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___RefetchKeybag);
  id v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic_copy(v7, v8, v2, 32LL);
    v9->_userInitiated = 1;
  }

  uint64_t v10 = sub_1001B6534((id *)&v9->super.isa);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v19 = 0LL;
  id v12 = [v11 resultWithError:&v19];
  id v13 = v19;

  uint64_t v14 = ASDLogHandleForCategory(28LL);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v2;
    __int16 v22 = 1024;
    LODWORD(v23) = (_DWORD)v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Keybag refresh complete with result: %d",  buf,  0x12u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = ASDErrorWithSafeUserInfo(v13);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v12, v18);
}

id sub_1002F8AE4(void *a1)
{
  if (a1)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForProperty:@"last_duet_sync"]);
    v2 = v1;
    if (v1) {
      id v3 = v1;
    }
    else {
      id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    }
    id v4 = v3;
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_1002F8B84(uint64_t a1, const __CFString *a2)
{
  id v3 = (void *)CFPreferencesCopyAppValue(a2, @"com.apple.appstored");
  objc_opt_class(&OBJC_CLASS___NSArray, v4);
  id v5 = sub_1001B2BD8(v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

id sub_1002F8BE0(uint64_t a1, void *a2, id a3)
{
  id v5 = a2;
  objc_opt_self(a1);
  uint64_t v6 = (void *)CFPreferencesCopyAppValue(v5, @"com.apple.appstored");

  if ((objc_opt_respondsToSelector(v6, "BOOLValue") & 1) != 0) {
    a3 = [v6 BOOLValue];
  }

  return a3;
}

id sub_1002F8C58(uint64_t a1, const __CFString *a2)
{
  id v3 = (void *)CFPreferencesCopyAppValue(a2, @"com.apple.appstored");
  objc_opt_class(&OBJC_CLASS___NSDate, v4);
  id v5 = sub_1001B2BD8(v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

id sub_1002F8CB4(uint64_t a1, const __CFString *a2)
{
  id v3 = (void *)CFPreferencesCopyAppValue(a2, @"com.apple.appstored");
  objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  id v5 = sub_1001B2BD8(v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

id sub_1002F8D10(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = objc_opt_self(a1);
  return (id)sub_1002F8D38(v3, a2);
}

uint64_t sub_1002F8D38(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(a2, @"com.apple.appstored");
  objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  id v5 = sub_1001B2BD8(v3);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

uint64_t sub_1002F8D94(uint64_t a1, void *a2, const __CFString *a3)
{
  id v5 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(a3, v5, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

id sub_1002F8DEC(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(a2, @"com.apple.appstored");
  objc_opt_class(&OBJC_CLASS___NSString, v4);
  id v5 = sub_1001B2BD8(v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

CFPropertyListRef sub_1002F8E48(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"AdPlatformsStatusConditionSetDate",  @"com.apple.appstored");
}

uint64_t sub_1002F8E70(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"AdPlatformsStatusConditionSetDate", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

id sub_1002F8EC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"TargetDate",  v3));

  id v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.appstored");
  return v5;
}

id sub_1002F8F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"PostIntervalOverrideSeconds",  v3));

  id v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.appstored");
  return v5;
}

void sub_1002F8FB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_self(a1);
  key = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"TargetDate",  v5));

  CFPreferencesSetAppValue(key, v6, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

CFPropertyListRef sub_1002F9054(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"CrossfirePostMetricsSamplingPercentageOverride",  @"com.apple.appstored");
}

NSData *sub_1002F907C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  id v5 = (__CFString *)sub_1002F9108(v4, v3);

  id v6 = (void *)CFPreferencesCopyAppValue(v5, @"com.apple.appstored");
  if (v6) {
    id v7 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v6,  0LL);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

NSString *sub_1002F9108(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AMSDevice serialNumber](&OBJC_CLASS___AMSDevice, "serialNumber"));
  id v5 = v4;
  if (!v4)
  {
    if (!sub_100303228((uint64_t)&OBJC_CLASS___AMSDevice))
    {
      uint64_t v6 = ASDLogHandleForCategory(14LL);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "Database defaults key generation failed unexpectedly",  buf,  2u);
      }
    }

    id v5 = @"xyzzy";
  }

  uint64_t v8 = v5;

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:v8]);
  uint64_t v10 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%lu",  [v9 hash]);

  return v10;
}

void sub_1002F9220(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_opt_self(a1);
  key = (__CFString *)sub_1002F9108(v7, v5);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 base64EncodedStringWithOptions:0]);
  CFPreferencesSetAppValue(key, v8, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

double sub_1002F92B8(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  uint64_t v2 = objc_opt_self(v1);
  id v3 = (void *)sub_1002F8D38(v2, @"DiagnosticClockOffset");
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }

  else
  {
    double v6 = 0.0;
  }

  return v6;
}

BOOL sub_1002F9310(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue(@"AppUsageUseTestTopic", @"com.apple.appstored", 0LL) != 0;
}

CFPropertyListRef sub_1002F9344(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue(@"BeagleApps", @"com.apple.appstored");
}

CFPropertyListRef sub_1002F936C(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"AnalyticsClientIDOverride",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002F9394(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadeDefaultApp",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002F93BC(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadeDeviceGUID",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002F93E4(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadeDeviceID",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002F940C(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadeDeviceIDCreationDate",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002F9434(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadePayoutDeviceID",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002F945C(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadePayoutResetDate",  @"com.apple.appstored");
}

BOOL sub_1002F9484(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  objc_opt_self(v1);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"ArcadeShouldRetryOptOut",  @"com.apple.appstored",  &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1;
}

CFPropertyListRef sub_1002F94D0(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ArcadeSubscriptionState",  @"com.apple.appstored");
}

uint64_t sub_1002F94F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  objc_opt_self(v4);
  CFPreferencesSetAppValue(@"ArcadeDeviceGUID", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002F954C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  objc_opt_self(v4);
  CFPreferencesSetAppValue(@"ArcadeDeviceID", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002F95A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  objc_opt_self(v4);
  CFPreferencesSetAppValue(@"ArcadeDeviceIDCreationDate", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002F95F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"ArcadePayoutResetDate", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

void sub_1002F9644(uint64_t a1, void *a2)
{
  id value = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"ArcadePayoutDeviceID", value, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002F96A0(uint64_t a1, int a2)
{
  id v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a2) {
    id v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"ArcadeShouldRetryOptOut", *v3, @"com.apple.appstored");
  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

void sub_1002F96F8(uint64_t a1, void *a2)
{
  id value = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"ArcadeSubscriptionState", value, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

BOOL sub_1002F9754(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue( @"ShouldShowAlertWhenArcadeDeviceIDRollsOver",  @"com.apple.appstored",  0LL) != 0;
}

id sub_1002F9788(uint64_t a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyAppValue(@"OncePerBoot", @"com.apple.appstored");
  if (!v1) {
    uint64_t v1 = &__NSDictionary0__struct;
  }
  return v1;
}

void sub_1002F97C0(uint64_t a1, void *a2)
{
  id value = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"OncePerBoot", value, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

id sub_1002F981C(uint64_t a1)
{
  return (id)sub_1002F8D38( (uint64_t)&OBJC_CLASS___AppDefaultsManager,  @"PowerPluggedInOverride");
}

id sub_1002F9844(uint64_t a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyAppValue(@"AMSMetricsCanaryIdentifier", @"com.apple.AppleMediaServices");
  objc_opt_class(&OBJC_CLASS___NSString, v2);
  id v3 = sub_1001B2BD8(v1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

BOOL sub_1002F98A0(uint64_t a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"RepairForceSbsync",  @"com.apple.appstored",  &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1;
}

CFPropertyListRef sub_1002F98F4(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"AttemptedPreflightAccounts",  @"com.apple.appstored");
}

uint64_t sub_1002F991C(uint64_t a1)
{
  uint64_t v1 = (void *)qword_1004626A8;
  qword_1004626A8 = 0LL;

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

BOOL sub_1002F99F4(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue(@"PerformedPostRestoreUpdate", @"com.apple.appstored", 0LL) != 0;
}

CFPropertyListRef sub_1002F9A28(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"RestoreSoftFailureRetryDate",  @"com.apple.appstored");
}

void sub_1002F9A50(uint64_t a1, void *a2)
{
  id value = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"AttemptedPreflightAccounts", value, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002F9AAC(uint64_t a1, int a2)
{
  id v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a2) {
    id v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"PerformedPostRestoreUpdate", *v3, @"com.apple.appstored");
  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

void sub_1002F9B04(uint64_t a1, void *a2)
{
  id value = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"RestoreSoftFailureRetryDate", value, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

id sub_1002F9B60(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1002F9C2C;
  id v11 = sub_1002F9C3C;
  id v12 = 0LL;
  id v2 = sub_1002F9C44();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002F9C84;
  v6[3] = &unk_1003F27A0;
  v6[4] = &v7;
  v6[5] = v1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t sub_1002F9C2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1002F9C3C(uint64_t a1)
{
}

id sub_1002F9C44()
{
  if (qword_1004626B8 != -1) {
    dispatch_once(&qword_1004626B8, &stru_1003F27C0);
  }
  return (id)qword_1004626B0;
}

void sub_1002F9C84(uint64_t a1)
{
  id v2 = sub_1002F9CBC(*(void *)(a1 + 40));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_1002F9CBC(uint64_t a1)
{
  if (qword_1004626A8) {
    return (id)qword_1004626A8;
  }
  else {
    return (id)(id)CFPreferencesCopyAppValue( @"RestoreInstallsFailedWithCodeSigError",  @"com.apple.appstored");
  }
}

void sub_1002F9CF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_opt_self(a1);
  id v9 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  sub_1002F9DAC(v7, v8, v5);
}

void sub_1002F9DAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_self(a1);
  if ([v5 count])
  {
    id v8 = sub_1002F9C44();
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002F9E78;
    block[3] = &unk_1003EC880;
    uint64_t v13 = v7;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void sub_1002F9E78(uint64_t a1)
{
  id v2 = sub_1002F9CBC(*(void *)(a1 + 48));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = &__NSDictionary0__struct;
  }
  id v5 = [v3 mutableCopy];

  id v6 = [v5 count];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( v5,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 40),  *(void *)(*((void *)&v16 + 1) + 8 * (void)i),  (void)v16);
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  if (*(void *)(a1 + 40) || v6 != [v5 count])
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = v5;
    objc_opt_self(v12);
    id v14 = [v13 copy];

    uint64_t v15 = (void *)qword_1004626A8;
    qword_1004626A8 = (uint64_t)v14;

    CFPreferencesSetAppValue( @"RestoreInstallsFailedWithCodeSigError",  (CFPropertyListRef)qword_1004626A8,  @"com.apple.appstored");
    CFPreferencesAppSynchronize(@"com.apple.appstored");
  }
}

CFPropertyListRef sub_1002FA020(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ManageSubsOnDeleteBlacklist",  @"com.apple.appstored");
}

uint64_t sub_1002FA048(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"ManageSubsOnDeleteBlacklist", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

BOOL sub_1002FA098(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  BOOL v2 = sub_10027362C((uint64_t)&OBJC_CLASS___Restrictions);
  objc_opt_self(v1);
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v3 = CFPreferencesGetAppBooleanValue( @"AutoUpdatesEnabled",  @"com.apple.itunesstored",  &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat == 1) {
    return v3;
  }
  else {
    return v2;
  }
}

CFPropertyListRef sub_1002FA108(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"UpdateCleanupTime",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA130(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"LastUpdatesCheck",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA158(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"LastAutoUpdateCompletion",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA180(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"PreviouslyInstalledProvisionedApps",  @"com.apple.appstored");
}

BOOL sub_1002FA1A8(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  objc_opt_self(v1);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"DoForceDeltaUpdateFailure",  @"com.apple.appstored",  &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1;
}

uint64_t sub_1002FA1F4(uint64_t a1)
{
  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA23C(uint64_t a1, int a2)
{
  BOOL v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a2) {
    BOOL v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"AutoUpdatesEnabled", *v3, @"com.apple.itunesstored");
  return CFPreferencesAppSynchronize(@"com.apple.itunesstored");
}

BOOL sub_1002FA294(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  objc_opt_self(v1);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"HasPresentedDistributorRestoreDialog",  @"com.apple.appstored",  &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1;
}

uint64_t sub_1002FA2E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"LastAutoUpdateCompletion", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA330(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"LastUpdatesPerform", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA380(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"LastUpdatesCheck", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA3D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"PreviouslyInstalledProvisionedApps", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

void sub_1002FA420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_opt_self(a1);
  objc_opt_self(v3);
  CFPreferencesSetAppValue( @"HasPresentedDistributorRestoreDialog",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2),  @"com.apple.appstored");
}

BOOL sub_1002FA468(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  objc_opt_self(v1);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"UseFollowupsForRestoreFailures",  @"com.apple.appstored",  &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1;
}

CFPropertyListRef sub_1002FA4B4(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"ForceAppDRMMode",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA4DC(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"vppExpiredApps",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA504(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"vppRevokedApps",  @"com.apple.appstored");
}

id sub_1002FA52C(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "ams_activeiTunesAccount"));

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountPropertyForKey:@"automaticDownloadKinds"]);
  id v4 = [v3 containsObject:@"software"];

  return v4;
}

BOOL sub_1002FA5A8(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue(@"AutomationRunning", @"com.apple.appstored", 0LL) != 0;
}

CFPropertyListRef sub_1002FA5DC(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"AppClaimHistory",  @"com.apple.appstored");
}

uint64_t sub_1002FA604(uint64_t a1)
{
  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

BOOL sub_1002FA640(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue(@"ExternalDownloadSkipATSCheck", @"com.apple.appstored", 0LL) != 0;
}

BOOL sub_1002FA674(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue(@"ExternalManifestSkipLocalCheck", @"com.apple.appstored", 0LL) != 0;
}

BOOL sub_1002FA6A8(uint64_t a1)
{
  return CFPreferencesGetAppBooleanValue(@"ExternalManifestSkipHTTPSCheck", @"com.apple.appstored", 0LL) != 0;
}

CFPropertyListRef sub_1002FA6DC(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"InvalidBuildToolVersions",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA704(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"LastOSBuildVersion",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA72C(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"PendingPushActionTypes",  @"com.apple.appstored");
}

uint64_t sub_1002FA754(uint64_t a1)
{
  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA79C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"AppClaimHistory", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA7EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"InvalidBuildToolVersions", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

void sub_1002FA83C(uint64_t a1, void *a2)
{
  id value = a2;
  objc_opt_self(a1);
  if (value)
  {
    CFPreferencesSetAppValue(@"LastOSBuildVersion", value, @"com.apple.appstored");
    CFPreferencesAppSynchronize(@"com.apple.appstored");
  }

  else
  {
    CFPreferencesSetAppValue(@"LastOSBuildVersion", 0LL, @"com.apple.appstored");
  }
}

uint64_t sub_1002FA8B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"PendingPushActionTypes", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA904(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"TransporterConfiguration", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

uint64_t sub_1002FA954(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  CFPreferencesSetAppValue(@"UpdateMigratorConfiguration", v3, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

CFPropertyListRef sub_1002FA9A4(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"TestFlightFeedbackOverrides",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA9CC(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"TransporterConfiguration",  @"com.apple.appstored");
}

CFPropertyListRef sub_1002FA9F4(uint64_t a1)
{
  return (id)CFPreferencesCopyAppValue( @"UpdateMigratorConfiguration",  @"com.apple.appstored");
}

void sub_1002FAA1C(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.appstored.restoreInstalls", v4);
  id v3 = (void *)qword_1004626B0;
  qword_1004626B0 = (uint64_t)v2;
}

id sub_1002FAAC4(uint64_t a1)
{
  if (a1)
  {
    dispatch_queue_t v2 = (void *)objc_opt_new(&OBJC_CLASS___ASDAppEvent);
    [v2 setAccountID:*(void *)(a1 + 208)];
    [v2 setBundleID:*(void *)(a1 + 72)];
    [v2 setBundleVersion:*(void *)(a1 + 80)];
    [v2 setCount:*(void *)(a1 + 296)];
    [v2 setCohort:*(void *)(a1 + 104)];
    [v2 setDeviceVendorID:*(void *)(a1 + 56)];
    [v2 setDuration:*(void *)(a1 + 136)];
    [v2 setEvid:*(void *)(a1 + 144)];
    objc_msgSend(v2, "setEventType:", sub_1001ABCD8((uint64_t)AppEvent, *(_BYTE *)(a1 + 24)));
    objc_msgSend(v2, "setEventSubtype:", sub_1001ABD20((uint64_t)AppEvent, *(unsigned __int8 *)(a1 + 28)));
    if (*(void *)(a1 + 152))
    {
      objc_msgSend(v2, "setEventTime:");
    }

    else
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 eventTime]);
      [v2 setEventTime:v3];
    }

    [v2 setForegroundUsage:*(void *)(a1 + 288)];
    [v2 setForegroundUsageEvents:*(void *)(a1 + 160)];
    [v2 setHasBeenPosted:*(unsigned __int8 *)(a1 + 26)];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 underlyingDictionary]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"appPlatform"]);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 underlyingDictionary]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appPlatform"]);
      [v2 setAppPlatform:v7];
    }

    id v8 = *(void **)(a1 + 16);
    BOOL v9 = v8 && ([v8 BOOLValue] & 1) != 0;
    [v2 setIsBeta:v9];
    [v2 setItemName:*(void *)(a1 + 192)];
    [v2 setItemID:*(void *)(a1 + 184)];
    [v2 setStartTime:*(void *)(a1 + 256)];
    [v2 setShortVersion:*(void *)(a1 + 248)];
    [v2 setStorefront:*(void *)(a1 + 264)];
    [v2 setWeekStartDate:*(void *)(a1 + 312)];
  }

  else
  {
    dispatch_queue_t v2 = 0LL;
  }

  return v2;
}

void sub_1002FAD68(uint64_t a1, int a2)
{
  if (a1)
  {
    char v2 = a2;
    id v4 = sub_1002FADC4((__CFString *)a1, a2);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [(id)a1 setProperty:v5 forBodyKey:@"eventType"];

    *(_BYTE *)(a1 + 24) = v2;
  }

__CFString *sub_1002FADC4(__CFString *a1, int a2)
{
  if (a1)
  {
    char v2 = &off_1003F0CF0;
    switch(a2)
    {
      case 0:
        break;
      case 1:
        char v2 = &off_1003F0CF8;
        break;
      case 2:
        else {
          char v2 = &off_1003F0D00;
        }
        break;
      case 3:
        char v2 = &off_1003F0D10;
        break;
      case 4:
        char v2 = &off_1003F0D20;
        break;
      default:
        char v2 = &off_1003F0D18;
        break;
    }

    a1 = *v2;
  }

  return a1;
}

void sub_1002FAE60(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"app_sessionreporter_key"];
    objc_storeStrong(a1 + 7, a2);
    id v4 = v5;
  }
}

void sub_1002FAEC4(void *a1, uint64_t a2)
{
  if (a1)
  {
    int v2 = a2;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
    id v5 = (void *)a1[1];
    a1[1] = v4;

    if (v2) {
      [a1 setProperty:a1[1] forBodyKey:@"app_sessionreporter_key_repaired"];
    }
  }

void sub_1002FAF40(void *a1, uint64_t a2)
{
  if (a1)
  {
    int v2 = a2;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
    id v5 = (void *)a1[2];
    a1[2] = v4;

    if (v2) {
      [a1 setProperty:a1[2] forBodyKey:@"isBeta"];
    }
  }

void sub_1002FAFBC(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"bundleId"];
    objc_storeStrong(a1 + 9, a2);
    id v4 = v5;
  }
}

void sub_1002FB020(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"bundleVersion"];
    objc_storeStrong(a1 + 10, a2);
    id v4 = v5;
  }
}

void sub_1002FB084(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"clientEventId"];
    objc_storeStrong(a1 + 11, a2);
    id v4 = v5;
  }
}

void sub_1002FB0E8(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"cohort"];
    objc_storeStrong(a1 + 13, a2);
    id v4 = v5;
  }
}

void sub_1002FB14C(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
    [a1 setProperty:v4 forBodyKey:@"cumulativeUserCount"];

    a1[15] = a2;
  }

void sub_1002FB1B4(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    [a1 setProperty:v4 forBodyKey:@"eventTime"];
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_CLASS___AppUsageMetricsEvent;
    objc_msgSendSuper2(&v5, "setEventTime:", v4);
    objc_storeStrong(a1 + 19, a2);
  }
}

void sub_1002FB23C(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v6 = v4;
    if ((objc_opt_respondsToSelector(v4, "stringValue") & 1) != 0)
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
      [a1 setProperty:v5 forBodyKey:@"externalVersionId"];
    }

    objc_storeStrong(a1 + 18, a2);
    id v4 = v6;
  }
}

void sub_1002FB2C8(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"collectionTime"];
    objc_storeStrong(a1 + 14, a2);
    id v4 = v5;
  }
}

void sub_1002FB32C(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    [a1 setProperty:v4 forBodyKey:@"duration"];

    a1[17] = a2;
  }

void sub_1002FB394(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"foregroundEvents"];
    objc_storeStrong(a1 + 20, a2);
    id v4 = v5;
  }
}

void sub_1002FB3F8(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"hardwareFamily"];
    objc_storeStrong(a1 + 21, a2);
    id v4 = v5;
  }
}

void sub_1002FB45C(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"hardwareModel"];
    objc_storeStrong(a1 + 22, a2);
    id v4 = v5;
  }
}

_BYTE *sub_1002FB4C0(_BYTE *result, int a2)
{
  if (result)
  {
    char v2 = a2;
    id v3 = result;
    id v4 = &off_1003F0D60;
    id v5 = &off_1003F0D68;
    if (a2 != 2) {
      id v5 = &off_1003F0D58;
    }
    if (a2 != 1) {
      id v4 = v5;
    }
    result = [result setProperty:*v4 forBodyKey:@"installationType"];
    v3[27] = v2;
  }

  return result;
}

void sub_1002FB528(_BYTE *a1, int a2)
{
  if (a1)
  {
    char v2 = a2;
    id v4 = sub_100271A54((uint64_t)&OBJC_CLASS___MetricsHandler, a2);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [a1 setProperty:v5 forBodyKey:@"installType"];

    a1[28] = v2;
  }

void sub_1002FB58C(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
    [a1 setProperty:v3 forBodyKey:@"isSystemApp"];
  }

void sub_1002FB5E8(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v6 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    if ([v5 length]) {
      [a1 setProperty:v5 forBodyKey:@"itemId"];
    }
    objc_storeStrong(a1 + 23, a2);

    id v4 = v6;
  }
}

void sub_1002FB668(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"os"];
    objc_storeStrong(a1 + 28, a2);
    id v4 = v5;
  }
}

void sub_1002FB6CC(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"startTime"];
    objc_storeStrong(a1 + 32, a2);
    id v4 = v5;
  }
}

void sub_1002FB730(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"clientId"];
    objc_storeStrong(a1 + 25, a2);
    id v4 = v5;
  }
}

void sub_1002FB794(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"dsId"];
    objc_storeStrong(a1 + 26, a2);
    id v4 = v5;
  }
}

void sub_1002FB7F8(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"osBuildNumber"];
    objc_storeStrong(a1 + 29, a2);
    id v4 = v5;
  }
}

void sub_1002FB85C(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"platform"];
    objc_storeStrong(a1 + 30, a2);
    id v4 = v5;
  }
}

void sub_1002FB8C0(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    [a1 setProperty:v4 forBodyKey:@"qualificationDuration"];

    a1[38] = a2;
  }

void sub_1002FB928(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"shortAppVersion"];
    objc_storeStrong(a1 + 31, a2);
    id v4 = v5;
  }
}

void sub_1002FB98C(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"storefront"];
    objc_storeStrong(a1 + 33, a2);
    id v4 = v5;
  }
}

void sub_1002FB9F0(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    [a1 setProperty:v4 forBodyKey:@"rangeEndTime"];

    a1[34] = a2;
  }

void sub_1002FBA58(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    [a1 setProperty:v4 forBodyKey:@"rangeStartTime"];

    a1[35] = a2;
  }

void sub_1002FBAC0(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
    [a1 setProperty:v4 forBodyKey:@"count"];

    a1[37] = a2;
  }

void sub_1002FBB28(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    [a1 setProperty:v4 forBodyKey:@"foregroundDuration"];

    a1[36] = a2;
  }

void sub_1002FBB90(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = v4;
    [a1 setProperty:v4 forBodyKey:@"weekStartDate"];
    objc_storeStrong(a1 + 39, a2);
    id v4 = v5;
  }
}

void sub_1002FC6DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_1002FC730(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1002FC740(uint64_t a1)
{
}

uint64_t sub_1002FC748(void *a1, void *a2)
{
  id v3 = a2;
  id v50 = 0LL;
  BOOL v4 = sub_1001E4634(v3, &v50);
  id v5 = (os_log_s *)v50;
  if (v4)
  {
    id v6 = (void *)a1[5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

    if (v8)
    {
      uint64_t v9 = ASDLogHandleForCategory(29LL);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = a1[4];
        if (v11) {
          uint64_t v12 = *(void **)(v11 + 48);
        }
        else {
          uint64_t v12 = 0LL;
        }
        id v13 = (void *)a1[5];
        id v14 = v12;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v15]);
        *(_DWORD *)buf = 138412546;
        __int128 v52 = v12;
        __int16 v53 = 2114;
        id v54 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Skipping store item coordinator due to existing restore",  buf,  0x16u);
      }

      goto LABEL_29;
    }

    uint64_t v19 = a1[6];
    id v49 = 0LL;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[RestoreInstallCreator createRestoreFromCoordinatorWithCoordinator:policy:error:]( &OBJC_CLASS____TtC9appstored21RestoreInstallCreator,  "createRestoreFromCoordinatorWithCoordinator:policy:error:",  v3,  v19,  &v49));
    uint64_t v10 = (os_log_s *)v49;
    if (v10)
    {
      id v21 = (void *)a1[7];
      id v22 = sub_1001E4DF4(v3);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      [v21 setObject:v10 forKeyedSubscript:v23];

      uint64_t v24 = ASDLogHandleForCategory(29LL);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = a1[4];
        if (v26) {
          id v27 = *(void **)(v26 + 48);
        }
        else {
          id v27 = 0LL;
        }
        id v28 = v27;
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v3 identity]);
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 bundleID]);
        *(_DWORD *)buf = 138412802;
        __int128 v52 = v27;
        __int16 v53 = 2114;
        id v54 = v30;
        __int16 v55 = 2114;
        char v56 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] Hard failed coordinator due to placeholder error: %{public}@",  buf,  0x20u);
      }
    }

    else
    {
      __int128 v31 = (void *)a1[8];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v3 identity]);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleID]);
      id v34 = [v31 indexOfObject:v33];

      if (v34 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v20 setValue:&off_10040D120 forProperty:@"order_index"];
      }

      else
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v34));
        [v20 setValue:v35 forProperty:@"order_index"];
      }

      uint64_t v36 = ASDLogHandleForCategory(29LL);
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = a1[4];
        if (v38) {
          id v39 = *(void **)(v38 + 48);
        }
        else {
          id v39 = 0LL;
        }
        id v40 = v39;
        uint64_t v41 = sub_100323C54(v20);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        *(_DWORD *)buf = 138412546;
        __int128 v52 = v39;
        __int16 v53 = 2112;
        id v54 = v42;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[%@] [%@] Beginning restore", buf, 0x16u);
      }

      [*(id *)(*(void *)(a1[9] + 8) + 40) addObject:v20];
      id v43 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_1002FCC80;
      v48[3] = &unk_1003EBA18;
      v48[4] = a1[9];
      [v44 modifyUsingTransaction:v48];

      *(void *)(*(void *)(a1[10] + 8) + 24) += [*(id *)(*(void *)(a1[9] + 8) + 40) count];
      id v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v46 = *(void *)(a1[9] + 8LL);
      id v25 = *(os_log_s **)(v46 + 40);
      *(void *)(v46 + 40) = v45;
    }

LABEL_28:
    goto LABEL_29;
  }

  uint64_t v17 = ASDLogHandleForCategory(29LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int128 v18 = (void *)a1[4];
    if (v18) {
      __int128 v18 = (void *)v18[6];
    }
    *(_DWORD *)buf = 138412802;
    __int128 v52 = v18;
    __int16 v53 = 2114;
    id v54 = v3;
    __int16 v55 = 2114;
    char v56 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[%@] Not responsible for coordinator: %{public}@ or error occurred: %{public}@",  buf,  0x20u);
  }

uint64_t sub_1002FCC80(uint64_t a1, void *a2)
{
  return 1LL;
}

void sub_1002FCCB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = ASDLogHandleForCategory(29LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      uint64_t v18 = *(void *)(v18 + 48);
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = v18;
    __int16 v25 = 2114;
    id v26 = v5;
    __int16 v27 = 2114;
    id v28 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@] Failing coordinator: %{public}@ with reason: %{public}@",  buf,  0x20u);
  }

  id v22 = 0LL;
  id v9 = sub_1001E4B34((uint64_t)&OBJC_CLASS___IXAppInstallCoordinator, v5, &v22);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v22;
  uint64_t v12 = v11;
  if (!v10)
  {
    uint64_t v17 = ASDLogHandleForCategory(29LL);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      if (v19) {
        uint64_t v19 = *(void *)(v19 + 48);
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      id v26 = v5;
      __int16 v27 = 2114;
      id v28 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[%@] Could not find coordinator to cancel: %{public}@ error: %{public}@",  buf,  0x20u);
    }

    goto LABEL_7;
  }

  id v21 = v11;
  char v13 = sub_1001E59A0(v10, v6, &v21);
  id v14 = v21;

  if ((v13 & 1) == 0)
  {
    uint64_t v15 = ASDLogHandleForCategory(29LL);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      if (v20) {
        uint64_t v20 = *(void *)(v20 + 48);
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      id v26 = v10;
      __int16 v27 = 2114;
      id v28 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[%@] Could not fail coordinator: %{public}@ error: %{public}@",  buf,  0x20u);
    }

    uint64_t v12 = v14;
LABEL_7:

    id v14 = v12;
  }
}

uint64_t sub_1002FCF24(uint64_t a1, void *a2)
{
  return 1LL;
}

void sub_1002FCF58(id *a1, void *a2)
{
  id v3 = a2;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D138));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
  id v5 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppInstallEntity, v4, v9);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[RestoreAppInstall defaultProperties](&OBJC_CLASS___RestoreAppInstall, "defaultProperties"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002FD094;
  v10[3] = &unk_1003F2838;
  id v11 = v3;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = a1[6];
  id v8 = v3;
  [v6 enumeratePersistentIDsAndProperties:v7 usingBlock:v10];
}

void sub_1002FD094(uint64_t a1, uint64_t a2)
{
  BOOL v4 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  id v6 = -[SQLiteEntity initWithPersistentID:onConnection:](v4, "initWithPersistentID:onConnection:", a2, v5);

  uint64_t v7 = -[LogKey initWithAppInstallEntity:]( objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey),  "initWithAppInstallEntity:",  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v6, "valueForProperty:", @"coordinator_id"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v6, "valueForProperty:", @"bootstrapped"));
  if ([v9 integerValue] != (id)2)
  {
    uint64_t v10 = sub_10021B614(v6);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = *(void **)(a1 + 40);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    [v12 addObject:v13];
  }

  id v14 = sub_100296DB0(v6, (uint64_t)@"failure_error");
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  __int128 v16 = (void *)v15;
  if (!v15)
  {
    if (!v8 || !v7) {
      goto LABEL_14;
    }
LABEL_13:
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[LogKey description](v7, "description"));
    [*(id *)(a1 + 48) setObject:v21 forKeyedSubscript:v8];

    goto LABEL_14;
  }

  int IsEqual = ASDErrorIsEqual(v15, ASDErrorDomain, 745LL);
  if (v8 && v7 && (IsEqual & 1) == 0) {
    goto LABEL_13;
  }
  if (IsEqual)
  {
    uint64_t v18 = ASDLogHandleForCategory(29LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      __int16 v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%@] [%@] DB has previous device based VPP app failure",  buf,  0x16u);
    }

    ASDDebugLog(2LL, @"[Restore][%@] DB has previous device based VPP app failure");
  }

id sub_1002FD344(uint64_t a1)
{
  if (qword_1004626C8 != -1) {
    dispatch_once(&qword_1004626C8, &stru_1003F2858);
  }
  return (id)qword_1004626C0;
}

void sub_1002FD388(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"IFNULL(app_install.phase, 10)",  &off_10040D150,  5LL));
  id v2 = (void *)qword_1004626C0;
  qword_1004626C0 = v1;
}

id sub_1002FD3C8(uint64_t a1)
{
  if (qword_1004626D8 != -1) {
    dispatch_once(&qword_1004626D8, &stru_1003F2878);
  }
  return (id)qword_1004626D0;
}

void sub_1002FD40C(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D168));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"IFNULL(app_install.phase, 10)",  &off_10040D180,  5LL,  v1));
  v7[1] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_state",  &off_10040D198));
  v7[2] = v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v4));
  id v6 = (void *)qword_1004626D0;
  qword_1004626D0 = v5;
}

id sub_1002FD530(uint64_t a1)
{
  if (qword_1004626E8 != -1) {
    dispatch_once(&qword_1004626E8, &stru_1003F2898);
  }
  return (id)qword_1004626E0;
}

void sub_1002FD574(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"client_type",  &off_10040D168));
  id v2 = (void *)qword_1004626E0;
  qword_1004626E0 = v1;
}

id sub_1002FD5B0(uint64_t a1)
{
  if (qword_1004626F8 != -1) {
    dispatch_once(&qword_1004626F8, &stru_1003F28B8);
  }
  return (id)qword_1004626F0;
}

void sub_1002FD5F4(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D168));
  v6[0] = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D168));
  v6[1] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v3));
  uint64_t v5 = (void *)qword_1004626F0;
  qword_1004626F0 = v4;
}

id sub_1002FD6E4(uint64_t a1)
{
  if (qword_100462708 != -1) {
    dispatch_once(&qword_100462708, &stru_1003F28D8);
  }
  return (id)qword_100462700;
}

void sub_1002FD728(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D198));
  v6[0] = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.phase, 10)",  &off_10040D150));
  v6[1] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v3));
  uint64_t v5 = (void *)qword_100462700;
  qword_100462700 = v4;
}

id sub_1002FD818(uint64_t a1)
{
  if (qword_100462728 != -1) {
    dispatch_once(&qword_100462728, &stru_1003F28F8);
  }
  return (id)qword_100462720;
}

void sub_1002FD85C(id a1)
{
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D168));
  v14[0] = v12;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D1B0));
  v14[1] = v11;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D1C8));
  v14[2] = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v2));
  v15[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D1F8));
  v13[0] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D1E0));
  v13[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v6));
  v15[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));
  uint64_t v10 = (void *)qword_100462720;
  qword_100462720 = v9;
}

id sub_1002FDA54(uint64_t a1)
{
  if (qword_100462738 != -1) {
    dispatch_once(&qword_100462738, &stru_1003F2918);
  }
  return (id)qword_100462730;
}

void sub_1002FDA98(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D168));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D1B0,  v1));
  v10[1] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D1C8));
  v10[2] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));
  v11[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D1F8));
  v11[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  uint64_t v9 = (void *)qword_100462730;
  qword_100462730 = v8;
}

id sub_1002FDC1C(uint64_t a1)
{
  if (qword_100462748 != -1) {
    dispatch_once(&qword_100462748, &stru_1003F2938);
  }
  return (id)qword_100462740;
}

void sub_1002FDC60(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D168));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D168,  v1));
  v7[1] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_state",  &off_10040D1B0));
  v7[2] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v4));
  id v6 = (void *)qword_100462740;
  qword_100462740 = v5;
}

id sub_1002FDD80(uint64_t a1)
{
  if (qword_100462758 != -1) {
    dispatch_once(&qword_100462758, &stru_1003F2958);
  }
  return (id)qword_100462750;
}

void sub_1002FDDC4(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D1F8));
  v6[0] = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"source_type",  &off_10040D168));
  v6[1] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v3));
  uint64_t v5 = (void *)qword_100462750;
  qword_100462750 = v4;
}

id sub_1002FDEB4(uint64_t a1)
{
  if (qword_100462768 != -1) {
    dispatch_once(&qword_100462768, &stru_1003F2978);
  }
  return (id)qword_100462760;
}

void sub_1002FDEF8(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_type",  &off_10040D168));
  v11[0] = v1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.phase, 10)",  &off_10040D180));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.phase, 10)",  &off_10040D210,  v2));
  v10[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v4));
  v11[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"restore_state",  &off_10040D168));
  void v11[2] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 3LL));
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));
  uint64_t v9 = (void *)qword_100462760;
  qword_100462760 = v8;
}

id sub_1002FE08C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v3));

  v9[0] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"IFNULL(app_install.phase, 10)",  &off_10040D180,  5LL));
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));

  return v7;
}

id sub_1002FE18C(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"source_type",  a2));
  v8[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D168));
  v8[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  return v6;
}

id sub_1002FE280(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_self(a1);
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (v9 && [v9 length])
    {
      if (v10 && [v10 unsignedLongLongValue])
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v9));
        v24[0] = v15;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"item_id",  v10));
        v24[1] = v16;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v17));

        goto LABEL_4;
      }

      if (a5)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Item identifier is required (source = '%ld')",  a2));
        uint64_t v19 = ASDErrorDomain;
        uint64_t v20 = 740LL;
        goto LABEL_12;
      }

id sub_1002FE4E0(uint64_t a1)
{
  if (qword_100462770 != -1) {
    dispatch_once(&qword_100462770, &stru_1003F2998);
  }
  return (id)qword_100462778;
}

void sub_1002FE524(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___ODRServiceDelegate);
  id v2 = (void *)qword_100462778;
  qword_100462778 = (uint64_t)v1;

  uint64_t v3 = objc_opt_self(&OBJC_CLASS___Storage);
  id v4 = sub_1002213A0(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"storeSystem.db"]);
  if (qword_100462778) {
    objc_storeStrong((id *)(qword_100462778 + 16), v5);
  }
}

void sub_1002FE5A8(id a1)
{
  uint64_t v1 = ASDLogHandleForCategory(19LL);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Edu Mode Enabled : %{BOOL}d", (uint8_t *)v3, 8u);
  }
}

id sub_1002FE648(id a1)
{
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002FE6C4;
    block[3] = &unk_1003E9880;
    void block[4] = a1;
    if (qword_100462790 != -1) {
      dispatch_once(&qword_100462790, block);
    }
    a1 = (id)qword_100462788;
  }

  return a1;
}

void sub_1002FE6C4(uint64_t a1)
{
  if (*(void *)(a1 + 32) && qword_100462780 != -1) {
    dispatch_once(&qword_100462780, &stru_1003F29B8);
  }
  uint64_t v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"OnDemandResources"]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  id v6 = (void *)qword_100462788;
  qword_100462788 = v5;

  uint64_t v7 = ASDLogHandleForCategory(19LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543362;
    uint64_t v10 = qword_100462788;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "BaseURL for ODR content : %{public}@",  (uint8_t *)&v9,  0xCu);
  }
}

void *sub_1002FE80C(void *result, _BYTE *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = ASDLogHandleForCategory(19LL);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Going to verify/create all of our library paths.",  buf,  2u);
    }

    v43[0] = NSFileOwnerAccountName;
    v43[1] = NSFileGroupOwnerAccountName;
    v44[0] = @"mobile";
    v44[1] = @"mobile";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v8 = sub_1002FE648(v3);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = v9;
    if (a2)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v9, "path"));
      *a2 = [v7 fileExistsAtPath:v11 isDirectory:0] ^ 1;
    }

    uint64_t v12 = ASDLogHandleForCategory(19LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Check/Creating the base library path.",  buf,  2u);
    }

    id v37 = 0LL;
    unsigned __int8 v14 = [v7 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v6 error:&v37];
    uint64_t v15 = (os_log_s *)v37;
    uint64_t v16 = ASDLogHandleForCategory(19LL);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = v17;
    if ((v14 & 1) != 0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v10;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Base path for ODR content : %{public}@",  buf,  0xCu);
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s URLByAppendingPathComponent:]( v10,  "URLByAppendingPathComponent:",  @"Database/odr.sqlite"));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 path]);
      uint64_t v21 = (void *)v3[3];
      v3[3] = v20;

      uint64_t v22 = ASDLogHandleForCategory(19LL);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Check/Creating the asset packs path.",  buf,  2u);
      }

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s URLByAppendingPathComponent:](v10, "URLByAppendingPathComponent:", @"AssetPacks"));
      uint64_t v36 = v15;
      unsigned int v25 = [v7 createDirectoryAtURL:v24 withIntermediateDirectories:1 attributes:v6 error:&v36];
      id v26 = v36;

      if (v25)
      {
        uint64_t v27 = objc_claimAutoreleasedReturnValue([v24 path]);
        id v28 = (void *)v3[4];
        v3[4] = v27;

        uint64_t v29 = ASDLogHandleForCategory(19LL);
        unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          __int128 v31 = (os_log_s *)v3[4];
          *(_DWORD *)buf = 138543362;
          id v40 = v31;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "AssetPacks path is: %{public}@",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v34 = ASDLogHandleForCategory(19LL);
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v40 = (os_log_s *)v24;
          __int16 v41 = 2114;
          uint64_t v42 = v26;
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Unable to create or find the Asset Packs path [%{public}@]. Error: %{public}@",  buf,  0x16u);
        }

        unsigned int v30 = v26;
        id v26 = 0LL;
      }

      unsigned __int8 v38 = v25;
      uint64_t v15 = v26;
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Unable to create hase path for ODR content.",  buf,  2u);
      }

      if (v15)
      {
        uint64_t v32 = ASDLogHandleForCategory(19LL);
        __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v40 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Underlying error : %{public}@",  buf,  0xCu);
        }
      }

      unsigned __int8 v38 = 0;
    }

    return (void *)v38;
  }

  return result;
}

uint64_t sub_1002FEDB4(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1) {
    return 1LL;
  }
  id v2 = v1;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contentsOfDirectoryAtPath:v2 error:0]);

  id v5 = [v4 mutableCopy];
  [v5 removeObject:@"StoreKit"];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

id sub_1002FEE64(id a1)
{
  if (a1)
  {
    if (qword_1004627A0 != -1) {
      dispatch_once(&qword_1004627A0, &stru_1003F29D8);
    }
    a1 = (id)qword_100462798;
  }

  return a1;
}

void sub_1002FEEAC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
  id v2 = (void *)qword_100462798;
  qword_100462798 = (uint64_t)v1;
}

void sub_1002FEED4(void *a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v8 = v3;
    id v4 = sub_1002FEE64(a1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v5 lock];

    v8[2]();
    id v6 = sub_1002FEE64(a1);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v7 unlock];

    uint64_t v3 = v8;
  }
}

void sub_1002FEF54(_Unwind_Exception *a1)
{
}

void *sub_1002FF088(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a1)
  {
    id v7 = [a1 init];
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[5] = a3;
    }
  }

  return a1;
}

id *sub_1002FF0E8(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1[2] integerForKey:@"min-keybag-repair-interval-seconds"]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valuePromise]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 thenWithBlock:&stru_1003F2A70]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002FF214;
    v12[3] = &unk_1003F2A30;
    v12[4] = v1;
    id v6 = v2;
    id v13 = v6;
    [v5 addSuccessBlock:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    void v10[2] = sub_1002FF70C;
    void v10[3] = &unk_1003E9CA8;
    id v7 = v6;
    id v11 = v7;
    [v5 addErrorBlock:v10];
    id v8 = v11;
    uint64_t v1 = (id *)v7;
  }

  return v1;
}

void sub_1002FF214(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = &unk_10038A000;
  if (v2)
  {
    id v36 = 0LL;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (*(void *)(v2 + 40) == 2LL) {
      uint64_t v5 = 8LL;
    }
    else {
      uint64_t v5 = 1LL;
    }
    id v6 = sub_10023FE48((uint64_t)&OBJC_CLASS___AMSKeybag, *(void **)(v2 + 8), v5, &v36);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, @"kbsync");
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 32) deviceGUID]);
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, @"guid");

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 32) deviceName]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, @"machineName");

      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 8), "ams_DSID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, @"ownerDsid");

      uint64_t v12 = *(void *)(v2 + 40);
      id v13 = @"family";
      if (v12 != 1) {
        id v13 = 0LL;
      }
      if (v12 == 2) {
        unsigned __int8 v14 = @"refetch";
      }
      else {
        unsigned __int8 v14 = v13;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, @"reason");
      id v15 = sub_10029AFA4((uint64_t)&OBJC_CLASS___FairPlay, *(void **)(v2 + 8), 0LL, (uint64_t)&v36);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, @"token");

      uint64_t v16 = v4;
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    id v17 = v36;
    if (v16)
    {
      uint64_t v18 = -[AMSURLRequestEncoder initWithBag:]( objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder),  "initWithBag:",  *(void *)(v2 + 16));
      -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v18, "setUrlKnownToBeTrusted:", 1LL);
      -[AMSURLRequestEncoder setAccount:](v18, "setAccount:", *(void *)(v2 + 8));
      -[AMSURLRequestEncoder setAnisetteType:](v18, "setAnisetteType:", 2LL);
      -[AMSURLRequestEncoder setClientInfo:](v18, "setClientInfo:", *(void *)(v2 + 24));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 16) URLForKey:@"authorizeMachine"]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:]( v18,  "requestWithMethod:bagURL:parameters:",  4LL,  v19,  v16));
      __int128 v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472LL;
      __int128 v33 = sub_1002FF7B8;
      uint64_t v34 = &unk_1003EBDD0;
      uint64_t v35 = v2;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 thenWithBlock:&v31]);

      uint64_t v3 = (void *)&unk_10038A000;
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v17));
    }

    __int128 v31 = _NSConcreteStackBlock;
    uint64_t v32 = v3[185];
    __int128 v33 = sub_1002FF878;
    uint64_t v34 = &unk_1003EBDD0;
    uint64_t v35 = v2;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 thenWithBlock:&v31]);
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = v3[185];
  uint64_t v23 = v27;
  id v28 = sub_1002FF584;
  uint64_t v29 = &unk_1003F2A08;
  id v30 = *(id *)(a1 + 40);
  [v22 addSuccessBlock:&v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = v23;
  void v24[2] = sub_1002FF700;
  v24[3] = &unk_1003E9CA8;
  id v25 = *(id *)(a1 + 40);
  [v22 addErrorBlock:v24];
}

void sub_1002FF584(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = sub_1001DF2AC(v8, @"failureType");
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)v10;
  if (v10)
  {
    else {
      id v12 = 0LL;
    }
    uint64_t v17 = ASDErrorWithTitleAndMessage(ASDServerErrorDomain, v12, @"Server Error", 0LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [*(id *)(a1 + 32) finishWithError:v18];
  }

  else
  {
    id v13 = sub_1001DEFF8(v8, @"keybag");
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
      id v19 = 0LL;
      [v15 importKeybagWithData:v14 error:&v19];
      id v16 = v19;
    }

    else
    {
      id v16 = 0LL;
    }

    [*(id *)(a1 + 32) finishWithSuccess];
  }
}

id sub_1002FF700(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

id sub_1002FF70C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void sub_1002FF718(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_1002FF0E8(a1);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_1002FF7A8;
    v6[3] = &unk_1003EAEC8;
    id v7 = v3;
    [v5 addFinishBlock:v6];
  }
}

uint64_t sub_1002FF7A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1002FF7B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setCachePolicy:1];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = objc_getProperty(v5, v4, 48LL, 1);
    if (v6)
    {
      id v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
      [v3 setValue:v8 forHTTPHeaderField:@"X-FM-Dsid"];
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9 && *(void *)(v9 + 40) == 2LL) {
      [v3 setTimeoutInterval:15.0];
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v3));

  return v10;
}

id sub_1002FF878(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(&OBJC_CLASS___RequestEnvironment);
  id v6 = v4;
  if (v4)
  {
    objc_setProperty_atomic_copy(v4, v5, *(id *)(*(void *)(a1 + 32) + 24LL), 8LL);
    objc_setProperty_atomic_copy(v6, v7, *(id *)(*(void *)(a1 + 32) + 56LL), 16LL);
    id v8 = objc_opt_new(&OBJC_CLASS___SilentRequestPresenter);
    objc_setProperty_atomic(v6, v9, v8, 32LL);
  }

  else
  {
    id v8 = objc_opt_new(&OBJC_CLASS___SilentRequestPresenter);
  }

  id v10 = sub_1001E636C((uint64_t)&OBJC_CLASS___AMSURLSession);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1001E66A0(v11, v3, v6);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

AMSPromise *__cdecl sub_1002FF954(id a1, NSNumber *a2)
{
  uint64_t v2 = a2;
  NSInteger v3 = -[NSNumber integerValue](v2, "integerValue");
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1004627A8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v4 systemUptime];
  uint64_t v6 = (uint64_t)v5;

  if (v6 - qword_1004627B0 >= v3)
  {
    qword_1004627B0 = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1004627A8);
    SEL v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", &__kCFBooleanTrue));
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1004627A8);
    uint64_t v7 = ASDErrorWithUserInfoAndFormat(603LL, 0LL, @"Previous request was within %@s of this one");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    SEL v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v8, v2));
  }

  return (AMSPromise *)v9;
}

void sub_1002FFAF0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___InstallCoordinationObserver);
  uint64_t v2 = (void *)qword_1004627C0;
  qword_1004627C0 = (uint64_t)v1;
}

uint64_t sub_1002FFDE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v7 = sub_100304844(v3, v4, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ([v8 existsInDatabase]
    && ((id v9 = sub_10021B73C(v8), (unint64_t)v9 + 40 <= 0x14)
      ? (BOOL v10 = ((1LL << (v9 + 40)) & 0x100401) == 0)
      : (BOOL v10 = 1),
        v10))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 persistentID]));
    id v17 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v16);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);

    uint64_t v18 = ASDLogHandleForCategory(2LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = v19;
    if (v12)
    {
      os_signpost_id_t v21 = *((void *)v12 + 13);
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        id v22 = sub_100298F48(*(id *)(a1 + 40));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)uint64_t v46 = 138543362;
        *(void *)&v46[4] = v23;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v21,  "Install/Install",  " error=%{public, signpost.description:attribute}@ ",  v46,  0xCu);
      }
    }

    id v24 = *(id *)(a1 + 40);
    objc_opt_self(&OBJC_CLASS___InstallCoordinationObserver);
    if ((ASDErrorIsEqual(v24, IXUserPresentableErrorDomain, 3LL) & 1) != 0) {
      int IsEqual = 1;
    }
    else {
      int IsEqual = ASDErrorIsEqual(v24, @"com.apple.frontboard.app-library", 1LL);
    }

    uint64_t v26 = ASDLogHandleForCategory(2LL);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (IsEqual)
    {
      if (v28)
      {
        unsigned __int8 v38 = sub_10021B614(v8);
        id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        uint64_t v40 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v46 = 138412546;
        *(void *)&v46[4] = v39;
        *(_WORD *)&v46[12] = 2114;
        *(void *)&v46[14] = v40;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%@] Canceling installation after receiving reason: %{public}@",  v46,  0x16u);
      }

      sub_1001B345C((id *)v3, (uint64_t)[v8 persistentID], (NSError *)0xFFFFFFFFFFFFFFE2);
    }

    else
    {
      if (v28)
      {
        __int16 v41 = sub_10021B614(v8);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        uint64_t v43 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v46 = 138412546;
        *(void *)&v46[4] = v42;
        *(_WORD *)&v46[12] = 2114;
        *(void *)&v46[14] = v43;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%@] Failing installation after receiving error: %{public}@",  v46,  0x16u);
      }

      if (ASDErrorSearch(*(void *)(a1 + 40), MIInstallerErrorDomain, 120LL))
      {
        id v29 = *(id *)(a1 + 40);
        id v30 = v8;
        id v31 = v3;
        objc_opt_self(&OBJC_CLASS___InstallCoordinationObserver);
        uint64_t v32 = ASDLogHandleForCategory(2LL);
        __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          uint64_t v44 = sub_10021B614(v30);
          id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          *(_DWORD *)uint64_t v46 = 138412290;
          *(void *)&v46[4] = v45;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_FAULT,  "[%@] SINF mismatch error has been detected",  v46,  0xCu);
        }

        if (os_variant_has_internal_content("com.apple.appstored"))
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"SSHTTPArchiveShouldSaveToDiskDecompressedNotification",  0LL,  0LL,  1u);
          uint64_t v35 = sub_100245744( (id *)objc_alloc(&OBJC_CLASS___PresentTapToRadarRequestFlow),  @"SINF Mismatch Error",  @"An unexpected installation failure occurred.");
          *(void *)uint64_t v46 = _NSConcreteStackBlock;
          *(void *)&v46[8] = 3221225472LL;
          *(void *)&v46[16] = sub_100302428;
          uint64_t v47 = &unk_1003F2AE0;
          id v48 = v29;
          id v49 = v30;
          id v50 = v31;
          if (v35) {
            objc_setProperty_atomic_copy(v35, v36, v46, 24LL);
          }
          sub_1002457F8((uint64_t)v35);
        }
      }

      id v37 = [v8 persistentID];
      if (v3) {
        sub_1001B1ABC((id *)v3, (uint64_t)v37, *(void **)(a1 + 40), 0);
      }
    }
  }

  else
  {
    uint64_t v11 = ASDLogHandleForCategory(2LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)uint64_t v46 = 138543618;
      *(void *)&v46[4] = v13;
      *(_WORD *)&v46[12] = 2114;
      *(void *)&v46[14] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Notified that coordinator %{public}@ canceled with reason: %{public}@, but we don't have an active installation for it.",  v46,  0x16u);
    }
  }

  return 1LL;
}

uint64_t sub_100300568(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v7 = sub_100304844(v3, v4, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ([v8 existsInDatabase])
  {
    id v9 = sub_10021B614(v8);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = ASDLogHandleForCategory(2LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      uint64_t v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] Completing installation after receiving notification",  (uint8_t *)&v26,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
    sub_1002F9CF8((uint64_t)&OBJC_CLASS___AppDefaultsManager, v14, 0LL);

    if (*(void *)(a1 + 40))
    {
      uint64_t v15 = ASDLogHandleForCategory(2LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        int v26 = 138412546;
        uint64_t v27 = v10;
        __int16 v28 = 2114;
        uint64_t v29 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] Application was installed at: %{public}@",  (uint8_t *)&v26,  0x16u);
      }

      [v8 setValue:*(void *)(a1 + 40) forProperty:@"bundle_url"];
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 persistentID]));
    id v19 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    uint64_t v21 = ASDLogHandleForCategory(2LL);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = v22;
    if (v20)
    {
      os_signpost_id_t v24 = v20[13];
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        LOWORD(v26) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_END,  v24,  "Install/Install",  "",  (uint8_t *)&v26,  2u);
      }
    }

    sub_1001B1A70((uint64_t)v3, (uint64_t)[v8 persistentID]);
  }

  return 1LL;
}

void sub_100300828(uint64_t a1)
{
  id v2 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);
  sub_1001CA35C((uint64_t)v5, v4);
}

void sub_1003009EC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v8 = sub_100304844(v4, v5, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (([v9 existsInDatabase] & 1) == 0)
  {
    uint64_t v10 = ASDLogHandleForCategory(2LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Ignoring coordinatorDidInstallPlaceholder for unknown coordinator: %{public}@",  (uint8_t *)&v13,  0xCu);
    }
  }
}

void sub_100300D84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100300DB0(uint64_t *a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = sub_1001E4C1C(a1[4], v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)a1[4] uniqueIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1[4] identity]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  if (v5 == 3) {
    id v9 = sub_100304C48(v3, v6, v8);
  }
  else {
    id v9 = sub_100304844(v3, v6, v8);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ([v10 existsInDatabase])
  {
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
    [v10 setValue:&off_10040D258 forProperty:@"priority"];
    id v11 = sub_1001E2698(v10, (uint64_t)@"phase");
    uint64_t v12 = ASDLogHandleForCategory(2LL);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = sub_10021B614(v10);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v31 = 138412546;
      uint64_t v32 = v15;
      __int16 v33 = 2048;
      id v34 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@] Prioritization request found existing install with phase %ld",  (uint8_t *)&v31,  0x16u);
    }

    if ((sub_100301104(a1[5], v10, v3, @"Prioritize Coordinator") & 1) == 0
      && (v11 == (id)10 || v11 == (id)-15LL))
    {
      id v16 = sub_1001E2698(v10, (uint64_t)@"IFNULL(app_install.bootstrapped, 2)");
      id v17 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = sub_10021B7AC(v10);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v16 == (id)2 && sub_1002E66C0(v18, v20))
      {
        if (sub_1001E2698(v10, (uint64_t)@"automatic_type"))
        {
          uint64_t v21 = ASDLogHandleForCategory(2LL);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = sub_10021B614(v10);
            os_signpost_id_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            int v31 = 138412290;
            uint64_t v32 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[%@] Removing automatic flag, prioritized by user",  (uint8_t *)&v31,  0xCu);
          }

          [v10 setValue:&off_10040D270 forProperty:@"automatic_type"];
        }

        uint64_t v25 = ASDLogHandleForCategory(2LL);
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = sub_10021B614(v10);
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          int v31 = 138412290;
          uint64_t v32 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] Reviewing network policy",  (uint8_t *)&v31,  0xCu);
        }

        uint64_t v29 = sub_1002D68B4(v10);
        sub_1003014F0(a1[5], [v10 persistentID], v29, (void *)a1[4]);
      }
    }
  }

  return 1LL;
}

uint64_t sub_100301104(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && sub_1001E2698(v7, (uint64_t)@"restore_type"))
  {
    id v10 = sub_1001E2698(v7, (uint64_t)@"phase");
    uint64_t v11 = ASDLogHandleForCategory(2LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = sub_10021B614(v7);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v40 = 138412802;
      __int16 v41 = v14;
      __int16 v42 = 2048;
      id v43 = v10;
      __int16 v44 = 2114;
      id v45 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] Prioritizing restore with phase: %ld with reason: %{public}@",  (uint8_t *)&v40,  0x20u);
    }

    [v7 setValue:&off_10040D258 forProperty:@"priority"];
    [v7 setValue:&off_10040D2A0 forProperty:@"phase"];
    [v7 setValue:&__kCFBooleanFalse forProperty:@"supress_dialogs"];
    id v15 = sub_100296DB0(v7, (uint64_t)@"failure_error");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    id v17 = (void *)v16;
    int v19 = 0;
    if (v16)
    {
      uint64_t v18 = ASDErrorDomain;
    }

    id v21 = sub_1001E2698(v7, (uint64_t)@"bootstrapped");
    id v22 = sub_1001E2698(v7, (uint64_t)@"restore_state");
    if (v21)
    {
      uint64_t v20 = 0LL;
      if (((v22 != (id)2) & ~v19) != 0 || v21 != (id)1) {
        goto LABEL_27;
      }
    }

    id v23 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
    os_signpost_id_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    unsigned int v25 = [v24 isConnected];

    uint64_t v26 = ASDLogHandleForCategory(2LL);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    __int16 v28 = v27;
    if (v25)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = sub_10021B614(v7);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        int v40 = 138412546;
        __int16 v41 = v30;
        __int16 v42 = 2114;
        id v43 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%@] Hydrating non-bootstrapped existing restore install with reason: %{public}@",  (uint8_t *)&v40,  0x16u);
      }

      if (v8) {
        id Property = objc_getProperty(v8, v31, 24LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v33 = Property;
      id v34 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v7 persistentID]));
      sub_1001EB5D8((uint64_t)v33, v34);
    }

    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v38 = sub_10021B614(v7);
        id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        int v40 = 138412546;
        __int16 v41 = v39;
        __int16 v42 = 2114;
        id v43 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[%@] Unable to promote due to no network with reason: %{public}@ due to no network",  (uint8_t *)&v40,  0x16u);
      }

      id v35 = sub_1001E26D0(v7, (uint64_t)@"bundle_id");
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      id v33 = v36;
      if (!v36 || ![v36 length]) {
        goto LABEL_26;
      }
      id v34 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v33,  1LL,  0LL);
      sub_1003028CC(v34);
    }

LABEL_26:
    uint64_t v20 = 1LL;
LABEL_27:

    goto LABEL_28;
  }

  uint64_t v20 = 0LL;
LABEL_28:

  return v20;
}

void sub_1003014F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) database]);
    id v10 = (void *)v9;
    if (v9) {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v9 + 16));
    }

    uint64_t v11 = (void *)qword_1004627B8;
    if (!qword_1004627B8)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      int v13 = (void *)qword_1004627B8;
      qword_1004627B8 = (uint64_t)v12;

      uint64_t v11 = (void *)qword_1004627B8;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    unsigned __int8 v15 = [v11 containsObject:v14];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = (void *)qword_1004627B8;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
      [v16 addObject:v17];

      uint64_t v18 = sub_1002D883C((id *)objc_alloc(&OBJC_CLASS___ReviewNetworkPolicyTask), v7);
      objc_initWeak(&location, v18);
      uint64_t v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472LL;
      id v22 = sub_100302CD4;
      id v23 = &unk_1003F2B30;
      objc_copyWeak(v27, &location);
      uint64_t v24 = a1;
      v27[1] = a2;
      id v25 = v7;
      id v26 = v8;
      [v18 setCompletionBlock:&v20];
      uint64_t v19 = *(void *)(a1 + 24);
      if (v19) {
        objc_msgSend(*(id *)(v19 + 8), "addOperation:", v18, v20, v21, v22, v23, v24, v25);
      }

      objc_destroyWeak(v27);
      objc_destroyWeak(&location);
    }
  }
}

void sub_1003016B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1003016D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_autoreleasePoolPush();
    id v8 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:placeholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initForInstallMachineryWithBundleIdentifier:placeholder:error:",  v5,  1LL,  0LL);
    uint64_t v9 = v8;
    if (v8)
    {
      if ([v8 isUpdate])
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
        if ([v10 length])
        {
          uint64_t v35 = 0LL;
          id v36 = &v35;
          uint64_t v37 = 0x2020000000LL;
          char v38 = 0;
          uint64_t v11 = *(dispatch_queue_s **)(a1 + 16);
          *(void *)block = _NSConcreteStackBlock;
          *(void *)&block[8] = 3221225472LL;
          *(void *)&block[16] = sub_1003027EC;
          *(void *)&block[24] = &unk_1003EC4F8;
          id v40 = v10;
          __int16 v41 = &v35;
          dispatch_sync(v11, block);
          BOOL v12 = *((_BYTE *)v36 + 24) != 0;

          _Block_object_dispose(&v35, 8);
        }

        else
        {
          BOOL v12 = 0;
        }
      }

      else
      {
        BOOL v12 = 0;
      }

      uint64_t v13 = ASDLogHandleForCategory(2LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [v9 isPlaceholder];
        *(_DWORD *)block = 138543874;
        *(void *)&void block[4] = v5;
        *(_WORD *)&block[12] = 1024;
        *(_DWORD *)&block[14] = v15;
        *(_WORD *)&block[18] = 2114;
        *(void *)&block[20] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Prioritize for bundleID: %{public}@ placeholder: %{BOOL}d coordinator: %{public}@",  block,  0x1Cu);
      }

      id v16 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      unsigned __int8 v18 = [v17 isConnected];

      if ((v18 & 1) != 0)
      {
        unsigned int v19 = [v9 isUpdate] ^ 1;
        if (!v6) {
          unsigned int v19 = 1;
        }
        if (((v12 | v19) & 1) != 0)
        {
          unsigned __int8 v20 = [v9 isAppStoreVendable];
          uint64_t v21 = ASDLogHandleForCategory(2LL);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          id v23 = v22;
          if ((v20 & 1) != 0)
          {
            BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v12)
            {
              if (v24)
              {
                *(_DWORD *)block = 138543362;
                *(void *)&void block[4] = v5;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Could not rescue placeholder - actively updating: %{public}@",  block,  0xCu);
              }
            }

            else
            {
              if (v24)
              {
                *(_DWORD *)block = 138543362;
                *(void *)&void block[4] = v5;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Attempting to cold promote %{public}@",  block,  0xCu);
              }

              id v23 = (os_log_s *)sub_100230530(objc_alloc(&OBJC_CLASS___RescueAbandonedPlaceholderOperation), v5);
              v33[0] = _NSConcreteStackBlock;
              v33[1] = 3221225472LL;
              v33[2] = sub_100302A24;
              v33[3] = &unk_1003EA180;
              id v34 = v5;
              sub_1002305A8(v23, v33);
              id v30 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
              uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
              uint64_t v32 = (void *)v31;
              if (v31) {
                [*(id *)(v31 + 8) addOperation:v23];
              }
            }
          }

          else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)block = 138543362;
            *(void *)&void block[4] = v5;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Could not rescue placeholder - not vendable: %{public}@",  block,  0xCu);
          }
        }

        else
        {
          uint64_t v27 = ASDLogHandleForCategory(2LL);
          __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)block = 138543362;
            *(void *)&void block[4] = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Canceling coordinator for orphaned app update %{public}@",  block,  0xCu);
          }

          uint64_t v29 = IXCreateUserPresentableError(1LL, 0LL, 0LL);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          [v6 cancelForReason:v23 client:1 error:0];
        }
      }

      else
      {
        uint64_t v25 = ASDLogHandleForCategory(2LL);
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 138412290;
          *(void *)&void block[4] = v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Skipping rehydrate of %@ - no network available",  block,  0xCu);
        }

        sub_1003028CC(v9);
      }
    }

    objc_autoreleasePoolPop(v7);
  }
}

uint64_t sub_100301C44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v7 = sub_100304844(v3, v4, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ([v8 existsInDatabase])
  {
    id v9 = [v8 persistentID];
    if (v3) {
      sub_1001B47BC((id *)v3, v9, -10LL, 2uLL);
    }
  }

  else
  {
    uint64_t v10 = ASDLogHandleForCategory(2LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Ignoring pausing request for unknown coordinator: %{public}@",  (uint8_t *)&v14,  0xCu);
    }
  }

  return 1LL;
}

BOOL sub_100301E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v7 = sub_100304844(v3, v4, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ([v8 existsInDatabase])
  {
    id v9 = (char *)sub_1001E2698(v8, (uint64_t)@"IFNULL(app_install.phase, 10)");
    BOOL v10 = v9 == (char *)-10LL || v9 == (char *)-15LL;
    if (v9 == (char *)-10LL || v9 + 15 == 0LL)
    {
      BOOL v12 = sub_10021B7AC(v8);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if ((sub_100301104(*(void *)(a1 + 40), v8, v3, @"Resume Coordinator") & 1) == 0)
      {
        id v13 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
        int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        int v15 = sub_1002E66C0(v14, v27);

        if (v15)
        {
          if (sub_1001E2698(v8, (uint64_t)@"automatic_type"))
          {
            uint64_t v16 = ASDLogHandleForCategory(2LL);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v18 = sub_10021B614(v8);
              unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              int v43 = 138412290;
              __int16 v44 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] Removing automatic flag, resumed by user",  (uint8_t *)&v43,  0xCu);
            }

            [v8 setValue:&off_10040D270 forProperty:@"automatic_type"];
          }

          uint64_t v20 = ASDLogHandleForCategory(2LL);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = sub_10021B614(v8);
            id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            int v43 = 138412290;
            __int16 v44 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@] Reviewing network policy before resuming by user request",  (uint8_t *)&v43,  0xCu);
          }

          BOOL v24 = sub_1002D68B4(v8);
          sub_1003014F0(*(void *)(a1 + 40), [v8 persistentID], v24, *(void **)(a1 + 32));
        }

        else
        {
          uint64_t v31 = ASDLogHandleForCategory(2LL);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = sub_10021B614(v8);
            id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
            int v43 = 138412290;
            __int16 v44 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%@] Resuming by user request",  (uint8_t *)&v43,  0xCu);
          }

          id v35 = sub_1002B0944((uint64_t)&OBJC_CLASS___ProgressCache);
          id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          id v37 = sub_10021B6D0(v8);
          char v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          sub_1002B15C0((uint64_t)v36, v38);

          sub_1001B4B5C(v3, 10, (uint64_t)[v8 persistentID]);
          if (v3)
          {
            id v40 = (EvaluatorDownload *)objc_getProperty(v3, v39, 24LL, 1);
            BOOL v24 = v40;
            if (v40) {
              v40[2]._logKey = (LogKey *)((unint64_t)v40[2]._logKey | 0x10000);
            }
          }

          else
          {
            BOOL v24 = 0LL;
          }
        }
      }
    }

    else
    {
      uint64_t v26 = ASDLogHandleForCategory(2LL);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = sub_10021B614(v8);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        int v43 = 138412290;
        __int16 v44 = v30;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_ERROR,  "[%@] Ignoring duplicate resumption request",  (uint8_t *)&v43,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v25 = ASDLogHandleForCategory(2LL);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = *(void **)(a1 + 32);
      int v43 = 138543362;
      __int16 v44 = v42;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_ERROR,  "Ignoring resumption request for unknown coordinator: %{public}@",  (uint8_t *)&v43,  0xCu);
    }

    BOOL v10 = 1LL;
  }

  return v10;
}

id sub_100302428(uint64_t a1)
{
  id v2 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"\n\nInstallation details:");
  -[NSMutableString appendFormat:](v2, "appendFormat:", @"\n\nError: %@", *(void *)(a1 + 32));
  id v3 = sub_1001E25D0(*(void **)(a1 + 40), (uint64_t)@"item_id");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001E25D0(*(void **)(a1 + 40), (uint64_t)@"evid");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_1001E26D0(*(void **)(a1 + 40), (uint64_t)@"bundle_id");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_1001E25D0(*(void **)(a1 + 40), (uint64_t)@"account_id");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableString appendFormat:]( v2,  "appendFormat:",  @"\n\nStore DSID: %@\nStore Item ID: %@\nStore Version ID: %@\nBundle ID: %@",  v10,  v4,  v6,  v8);
  uint64_t v11 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v8,  0LL,  0LL);
  BOOL v12 = v11;
  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v11, "iTunesMetadata"));
    id v14 = [v13 versionIdentifier];

    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v12, "iTunesMetadata"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 variantID]);

    -[NSMutableString appendFormat:]( v2,  "appendFormat:",  @"\n\nInstalled Version ID: %llu\nInstalled Variant ID: %@",  v14,  v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"parent_id",  [*(id *)(a1 + 40) persistentID]));
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) connection]);
  id v19 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppPackageEntity, v18, v17);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  void v24[2] = sub_10030267C;
  v24[3] = &unk_1003EB478;
  id v25 = *(id *)(a1 + 48);
  uint64_t v26 = v2;
  uint64_t v21 = v2;
  [v20 enumeratePersistentIDsUsingBlock:v24];
  id v22 = -[NSMutableString copy](v21, "copy");

  return v22;
}

void sub_10030267C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc(&OBJC_CLASS___AppPackageEntity);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  unsigned __int8 v18 = -[SQLiteEntity initWithPersistentID:onConnection:](v4, "initWithPersistentID:onConnection:", a2, v5);

  id v6 = sub_1001E25D0(v18, (uint64_t)@"package_type");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_1001E2798(v18, (uint64_t)@"package_url");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_1001E26D0(v18, (uint64_t)@"variant_id");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1001E25D0(v18, (uint64_t)@"blocked");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v18, "valueForProperty:", @"sinf"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 base64EncodedStringWithOptions:0]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](v18, "valueForProperty:", @"dp_info"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64EncodedStringWithOptions:0]);
  [*(id *)(a1 + 40) appendFormat:@"\n\nPackageType: %@\nPackageBlocked: %@\nPackageVariant: %@\nPackageURL: %@\nSINF: %@\nDPInfo: %@", v7, v13, v11, v9, v15, v17];
}

void sub_1003027EC(uint64_t a1)
{
  id v2 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100302874;
  v6[3] = &unk_1003F0748;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 readUsingSession:v6];
}

void sub_100302874(uint64_t a1, id a2)
{
  id v3 = sub_100304700(a2, *(void **)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
}

void sub_1003028CC(void *a1)
{
  id v14 = a1;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedName]);

  if (v1)
  {
    uint64_t v2 = ASDLocalizedString(@"HYDRATE_NO_NETWORK_TITLE_%@");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedName]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v3, v4));
    uint64_t v6 = ASDLocalizedString(@"HYDRATE_NO_NETWORK_MESSAGE");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  v5,  v7));

    uint64_t v9 = ASDLocalizedString(@"HYDRATE_NO_NETWORK_BUTTON_OK");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDialogAction actionWithTitle:](&OBJC_CLASS___AMSDialogAction, "actionWithTitle:", v10));
    [v8 addButtonAction:v11];

    id v12 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v12, "present"));
    [v13 waitUntilFinishedWithTimeout:60.0];
  }
}

void sub_100302A24(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = ASDLogHandleForCategory(2LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Could not rescue placeholder: %{public}@ due to error: %{public}@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

void sub_100302BA0(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 valueForKey:kCFBundleIdentifierKey]);

  uint64_t v3 = ASDLogHandleForCategory(2LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      int v9 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received app may be uninstalled notification for bundleID: %{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v_Block_object_dispose(va, 8) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Received app may be uninstalled notification but no bundleID was included",  (uint8_t *)&v8,  2u);
  }

  id v6 = sub_100233508((uint64_t)&OBJC_CLASS___MetricsCoordinator);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100233B14((uint64_t)v7, v2, 8LL);
}

void sub_100302CD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  void v6[2] = sub_100302D94;
  v6[3] = &unk_1003F2B08;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v6[1] = 3221225472LL;
  id v7 = v3;
  id v8 = WeakRetained;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v5 = WeakRetained;
  [v4 modifyUsingTransaction:v6];
}

BOOL sub_100302D94(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = (void *)qword_1004627B8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)(a1 + 64)));
  [v4 removeObject:v5];

  if (![(id)qword_1004627B8 count])
  {
    id v6 = (void *)qword_1004627B8;
    qword_1004627B8 = 0LL;
  }

  id v7 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
  id v10 = -[SQLiteEntity initWithPersistentID:onConnection:](v7, "initWithPersistentID:onConnection:", v8, v9);

  uint64_t v11 = (uint64_t)sub_1001E2698(v10, (uint64_t)@"IFNULL(app_install.phase, 10)");
  if (v11 >= 11)
  {
    uint64_t v25 = ASDLogHandleForCategory(2LL);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v27, 32LL, 1);
      }
      id v29 = Property;
      *(_DWORD *)buf = 138412290;
      id v42 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "[%@] Stopping because the installation is no longer paused",  buf,  0xCu);
    }
  }

  else
  {
    id v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472LL;
    id v37 = sub_10030312C;
    char v38 = &unk_1003ECF50;
    id v39 = (os_log_s *)*(id *)(a1 + 40);
    sub_10021C8F4(v10, &v35);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12 && (*(_BYTE *)(v12 + 48) & 1) != 0)
    {
      sub_1001B4B5C(v3, 10LL, -[SQLiteEntity persistentID](v10, "persistentID", v35, v36, v37, v38));
      if (v3)
      {
        uint64_t v31 = objc_getProperty(v3, v30, 24LL, 1);
        if (v31) {
          v31[16] |= 0x10000uLL;
        }
      }

      else
      {
        uint64_t v31 = 0LL;
      }
    }

    else
    {
      uint64_t v13 = ASDLogHandleForCategory(2LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v33 = *(id *)(a1 + 32);
        if (v33) {
          id v33 = objc_getProperty(v33, v15, 32LL, 1);
        }
        id v34 = v33;
        *(_DWORD *)buf = 138412290;
        id v42 = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[%@] Pausing after cellular network access was denied",  buf,  0xCu);
      }

      -[SQLiteEntity setValue:forProperty:]( v10,  "setValue:forProperty:",  &off_10040D288,  @"phase",  v35,  v36,  v37,  v38);
      uint64_t v18 = *(void *)(a1 + 48);
      id v17 = *(void **)(a1 + 56);
      id v19 = *(id *)(a1 + 32);
      if (v19) {
        id v19 = objc_getProperty(v19, v16, 32LL, 1);
      }
      id v20 = v19;
      if (v18)
      {
        id v40 = 0LL;
        unsigned __int8 v21 = [v17 pauseWithError:&v40];
        id v22 = v40;
        if ((v21 & 1) == 0)
        {
          uint64_t v23 = ASDLogHandleForCategory(2LL);
          BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v42 = v20;
            __int16 v43 = 2114;
            id v44 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[%@] Unable to re-pause after cellular access declined: %{public}@",  buf,  0x16u);
          }
        }
      }
    }

    uint64_t v26 = v39;
  }

  return v11 < 11;
}

void sub_10030312C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = a2;
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 56);
  }
  else {
    uint64_t v4 = 0LL;
  }
  sub_1002E60D4((uint64_t)v9, v4);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v6 = 0LL;
  }
  sub_1002E6174((uint64_t)v9, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 72);
  }
  else {
    uint64_t v8 = 0LL;
  }
  sub_1002E5F7C((uint64_t)v9, v8);
}

BOOL sub_100303228(uint64_t a1)
{
  if (qword_1004627D8 != -1) {
    dispatch_once(&qword_1004627D8, &stru_1003F2B50);
  }
  return dword_1004627D0 != 0;
}

void sub_100303274(id a1)
{
  size_t v4 = 4LL;
  if (sysctlbyname("kern.hv_vmm_present", &dword_1004627D0, &v4, 0LL, 0LL))
  {
    uint64_t v1 = ASDLogHandleForCategory(14LL);
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = *__error();
      *(_DWORD *)buf = 67109120;
      int v6 = v3;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "sysctlbyname for kern.hv_vmm_present failed with error: %{darwin.errno}d",  buf,  8u);
    }
  }

BOOL sub_10030334C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_self(a1);
  if (v7)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (const __CFDictionary *)MobileInstallationCheckCapabilitiesMatch(v7, v8);
    if (v12)
    {
      uint64_t v13 = v12;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v12, @"CapabilitiesMatch");
      if (Value) {
        BOOL v15 = CFBooleanGetValue(Value) != 0;
      }
      else {
        BOOL v15 = 0LL;
      }
      uint64_t v16 = (void *)CFDictionaryGetValue(v13, @"MismatchedCapabilities");
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = ASDLogHandleForCategory(14LL);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v23 = 138412802;
          id v24 = (id)objc_opt_class(v11, v20);
          __int16 v25 = 2114;
          id v26 = v9;
          __int16 v27 = 2114;
          id v28 = v17;
          id v22 = v24;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[%@]: [%{public}@] Mismatched capabilites: %{public}@",  (uint8_t *)&v23,  0x20u);
        }
      }

      CFRelease(v13);
    }

    else
    {
      BOOL v15 = 0LL;
    }
  }

  else
  {
    BOOL v15 = 1LL;
  }

  return v15;
}

id sub_1003034E4(uint64_t a1)
{
  if (qword_1004627E8 != -1) {
    dispatch_once(&qword_1004627E8, &stru_1003F2B70);
  }
  return (id)qword_1004627E0;
}

void sub_100303528(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___ThermalPressureMonitor);
  uint64_t v2 = (void *)qword_1004627E0;
  qword_1004627E0 = (uint64_t)v1;
}

void sub_10030363C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(_DWORD *)(v1 + 16) = -1;
    objc_initWeak(&location, (id)v1);
    uint64_t v2 = *(dispatch_queue_s **)(v1 + 8);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_100303914;
    v6[3] = &unk_1003EBB18;
    objc_copyWeak(&v7, &location);
    uint32_t v3 = notify_register_dispatch(kOSThermalNotificationPressureLevelName, (int *)(v1 + 16), v2, v6);
    if (v3)
    {
      uint64_t v4 = ASDLogHandleForCategory(14LL);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v10 = v3;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[Thermal] Registration for thermal pressure notification failed: %u",  buf,  8u);
      }
    }

    else
    {
      sub_1003039A4(v1);
    }

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

void sub_10030378C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

BOOL sub_100303810(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003038B4;
  v4[3] = &unk_1003E9BE0;
  void v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  BOOL v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1003038B4(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 20LL);
  return result;
}

void sub_1003038C8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:@"ThermalPressureStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_100303914(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    sub_1003039A4((uint64_t)WeakRetained);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    uint32_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003038C8;
    block[3] = &unk_1003E9880;
    void block[4] = v4;
    dispatch_async(v3, block);

    id WeakRetained = v4;
  }
}

void sub_1003039A4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  if (v2 != -1)
  {
    uint64_t state64 = 0LL;
    BOOL v3 = !notify_get_state(v2, &state64) && state64 > 0x13;
    BOOL v4 = v3;
    *(_BYTE *)(a1 + 20) = v4;
    uint64_t v5 = ASDLogHandleForCategory(14LL);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      uint64_t v8 = ASDLogHandleForCategory(14LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        if (*(_BYTE *)(a1 + 20)) {
          uint32_t v10 = @"elevated";
        }
        else {
          uint32_t v10 = @"nominal";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2048;
        uint64_t v15 = state64;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[Thermal] Thermal pressure is now %@ (%llu)",  buf,  0x16u);
      }
    }
  }

id sub_100303ADC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_self(a1);
  id v13 = 0LL;
  id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(v6, v7),  v5,  &v13);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = v13;
  uint64_t v11 = v10;
  if (a3 && !v9) {
    *a3 = v10;
  }

  return v9;
}

MIStoreMetadata *sub_100303B74(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___MIStoreMetadata);
  id v5 = v3;
  uint64_t v7 = v5;
  if (v4)
  {
    if (v5)
    {
      id v8 = objc_getProperty(v5, v6, 48LL, 1);
      -[MIStoreMetadata setArtistName:](v4, "setArtistName:", v8);

      id Property = objc_getProperty(v7, v9, 224LL, 1);
    }

    else
    {
      -[MIStoreMetadata setArtistName:](v4, "setArtistName:", 0LL);
      id Property = 0LL;
    }

    id v11 = Property;
    -[MIStoreMetadata setKind:](v4, "setKind:", v11);

    if (v7)
    {
      id v13 = objc_getProperty(v7, v12, 208LL, 1);
      -[MIStoreMetadata setItemID:](v4, "setItemID:", v13);

      id v15 = objc_getProperty(v7, v14, 216LL, 1);
    }

    else
    {
      -[MIStoreMetadata setItemID:](v4, "setItemID:", 0LL);
      id v15 = 0LL;
    }

    id v16 = v15;
    -[MIStoreMetadata setItemName:](v4, "setItemName:", v16);

    if (v7)
    {
      id v18 = objc_getProperty(v7, v17, 88LL, 1);
      -[MIStoreMetadata setShortItemName:](v4, "setShortItemName:", v18);

      id v20 = objc_getProperty(v7, v19, 144LL, 1);
    }

    else
    {
      -[MIStoreMetadata setShortItemName:](v4, "setShortItemName:", 0LL);
      id v20 = 0LL;
    }

    id v21 = v20;
    -[MIStoreMetadata setSoftwareVersionExternalIdentifier:](v4, "setSoftwareVersionExternalIdentifier:", v21);

    if (v7)
    {
      id v23 = objc_getProperty(v7, v22, 96LL, 1);
      -[MIStoreMetadata setSoftwareVersionBundleID:](v4, "setSoftwareVersionBundleID:", v23);

      -[MIStoreMetadata setIsB2BCustomApp:](v4, "setIsB2BCustomApp:", v7[15] & 1);
      id v25 = objc_getProperty(v7, v24, 104LL, 1);
    }

    else
    {
      -[MIStoreMetadata setSoftwareVersionBundleID:](v4, "setSoftwareVersionBundleID:", 0LL);
      -[MIStoreMetadata setIsB2BCustomApp:](v4, "setIsB2BCustomApp:", 0LL);
      id v25 = 0LL;
    }

    id v26 = v25;
    -[MIStoreMetadata setBundleShortVersionString:](v4, "setBundleShortVersionString:", v26);

    if (v7)
    {
      id v28 = objc_getProperty(v7, v27, 112LL, 1);
      -[MIStoreMetadata setBundleVersion:](v4, "setBundleVersion:", v28);

      id v30 = objc_getProperty(v7, v29, 168LL, 1);
    }

    else
    {
      -[MIStoreMetadata setBundleVersion:](v4, "setBundleVersion:", 0LL);
      id v30 = 0LL;
    }

    id v31 = v30;
    -[MIStoreMetadata setHasOrEverHasHadIAP:](v4, "setHasOrEverHasHadIAP:", v31);

    if (v7)
    {
      -[MIStoreMetadata setLaunchProhibited:](v4, "setLaunchProhibited:", v7[17] & 1);
      id v33 = objc_getProperty(v7, v32, 152LL, 1);
    }

    else
    {
      -[MIStoreMetadata setLaunchProhibited:](v4, "setLaunchProhibited:", 0LL);
      id v33 = 0LL;
    }

    id v34 = v33;
    -[MIStoreMetadata setGenre:](v4, "setGenre:", v34);

    if (v7)
    {
      id v36 = objc_getProperty(v7, v35, 160LL, 1);
      -[MIStoreMetadata setGenreID:](v4, "setGenreID:", v36);

      id v38 = objc_getProperty(v7, v37, 320LL, 1);
    }

    else
    {
      -[MIStoreMetadata setGenreID:](v4, "setGenreID:", 0LL);
      id v38 = 0LL;
    }

    id v39 = v38;
    id v40 = sub_1002B86C0(v39, &stru_1003F2BB8);
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    -[MIStoreMetadata setSubGenres:](v4, "setSubGenres:", v41);

    if (v7)
    {
      id v43 = objc_getProperty(v7, v42, 272LL, 1);
      -[MIStoreMetadata setRatingLabel:](v4, "setRatingLabel:", v43);

      id v45 = objc_getProperty(v7, v44, 280LL, 1);
    }

    else
    {
      -[MIStoreMetadata setRatingLabel:](v4, "setRatingLabel:", 0LL);
      id v45 = 0LL;
    }

    id v46 = v45;
    -[MIStoreMetadata setRatingRank:](v4, "setRatingRank:", v46);

    if (v7)
    {
      -[MIStoreMetadata setGameCenterEnabled:](v4, "setGameCenterEnabled:", v7[9] & 1);
      -[MIStoreMetadata setGameCenterEverEnabled:](v4, "setGameCenterEverEnabled:", v7[10] & 1);
      -[MIStoreMetadata setIsAutoDownload:](v4, "setIsAutoDownload:", v7[8] & 1);
      id v48 = objc_getProperty(v7, v47, 248LL, 1);
    }

    else
    {
      -[MIStoreMetadata setGameCenterEnabled:](v4, "setGameCenterEnabled:", 0LL);
      -[MIStoreMetadata setGameCenterEverEnabled:](v4, "setGameCenterEverEnabled:", 0LL);
      -[MIStoreMetadata setIsAutoDownload:](v4, "setIsAutoDownload:", 0LL);
      id v48 = 0LL;
    }

    id v49 = v48;
    -[MIStoreMetadata setPurchaseDate:](v4, "setPurchaseDate:", v49);

    if (v7)
    {
      if ((v7[18] & 1) != 0) {
        uint64_t v50 = 1LL;
      }
      else {
        uint64_t v50 = v7[16] & 1;
      }
      -[MIStoreMetadata setPurchasedRedownload:](v4, "setPurchasedRedownload:", v50);
      id v52 = objc_getProperty(v7, v51, 256LL, 1);
    }

    else
    {
      -[MIStoreMetadata setPurchasedRedownload:](v4, "setPurchasedRedownload:", 0LL);
      id v52 = 0LL;
    }

    id v53 = v52;
    -[MIStoreMetadata setRedownloadParams:](v4, "setRedownloadParams:", v53);

    if (v7) {
      id v55 = objc_getProperty(v7, v54, 264LL, 1);
    }
    else {
      id v55 = 0LL;
    }
    id v56 = v55;
    -[MIStoreMetadata setReleaseDate:](v4, "setReleaseDate:", v56);

    if (v7) {
      id v58 = objc_getProperty(v7, v57, 296LL, 1);
    }
    else {
      id v58 = 0LL;
    }
    id v59 = v58;
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v59 longLongValue]));
    -[MIStoreMetadata setStorefront:](v4, "setStorefront:", v60);

    id v61 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    id v63 = sub_10025670C(v62, @"countryCode");
    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 valueWithError:0]);
    -[MIStoreMetadata setStorefrontCountryCode:](v4, "setStorefrontCountryCode:", v65);

    if (v7)
    {
      id v67 = objc_getProperty(v7, v66, 184LL, 1);
      -[MIStoreMetadata setIAdConversionDate:](v4, "setIAdConversionDate:", v67);

      id v69 = objc_getProperty(v7, v68, 192LL, 1);
    }

    else
    {
      -[MIStoreMetadata setIAdConversionDate:](v4, "setIAdConversionDate:", 0LL);
      id v69 = 0LL;
    }

    id v70 = v69;
    -[MIStoreMetadata setIAdImpressionDate:](v4, "setIAdImpressionDate:", v70);

    if (v7)
    {
      id v72 = objc_getProperty(v7, v71, 176LL, 1);
      unsigned int v73 = (void *)objc_claimAutoreleasedReturnValue([v72 stringValue]);
      -[MIStoreMetadata setIAdAttribution:](v4, "setIAdAttribution:", v73);

      id v75 = objc_getProperty(v7, v74, 312LL, 1);
    }

    else
    {
      char v81 = (void *)objc_claimAutoreleasedReturnValue([0 stringValue]);
      -[MIStoreMetadata setIAdAttribution:](v4, "setIAdAttribution:", v81);

      id v75 = 0LL;
    }

    id v76 = v75;
    -[MIStoreMetadata setStoreCohort:](v4, "setStoreCohort:", v76);

    if (v7) {
      id v78 = objc_getProperty(v7, v77, 336LL, 1);
    }
    else {
      id v78 = 0LL;
    }
    id v79 = v78;
    -[MIStoreMetadata setNameTranscriptions:](v4, "setNameTranscriptions:", v79);
  }

  return v4;
}

id sub_100304244(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  id v7 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a1,  1LL,  &v7));
  id v4 = v7;
  id v5 = v4;
  if (a2)
  {
    if (!v3) {
      *a2 = v4;
    }
  }

  return v3;
}

void sub_1003042C8(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
    [a1 setAppleID:v4];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_DSID"));
    [a1 setDSPersonID:v5];

    id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_altDSID"));
    [a1 setAltDSID:v6];
  }

void sub_100304364(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    [a1 setSourceApp:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 referrerName]);
    [a1 setReferrerApp:v6];

    id v7 = (id)objc_claimAutoreleasedReturnValue([v3 referrerURL]);
    [a1 setReferrerURL:v7];
  }

void sub_100304410(void *a1, void *a2, int a3)
{
  id v11 = a2;
  if (a1)
  {
    id v5 = sub_1002374D4(v11);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [a1 setDownloaderID:v6];

    id v7 = sub_100237608(v11);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [a1 setFamilyID:v8];

    id v9 = sub_100237674(v11);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [a1 setPurchaserID:v10];

    if (a3) {
      [a1 setDeviceBasedVPP:sub_100237628(v11)];
    }
  }
}

id sub_1003044C8(id a1, StoreItemSubGenre *a2)
{
  int v2 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___MIStoreMetadataSubGenre);
  if (v2)
  {
    id v5 = objc_getProperty(v2, v3, 8LL, 1);
    id Property = objc_getProperty(v2, v6, 16LL, 1);
  }

  else
  {
    id v5 = 0LL;
    id Property = 0LL;
  }

  id v8 = Property;

  id v9 = [v4 initWithGenre:v5 genreID:v8];
  return v9;
}

id sub_10030456C(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  if (!a1)
  {
    id v11 = 0LL;
    goto LABEL_9;
  }

  id v15 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 dictionaryRepresentation]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  200LL,  0LL,  &v15));

  id v9 = v15;
  if (v8)
  {
    id v10 = -[IXApplicationIdentity initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:",  v6);
    id v14 = v9;
    id v11 = +[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:plistData:options:error:]( &OBJC_CLASS___IXAppInstallCoordinator,  "updateiTunesMetadataForAppWithIdentity:plistData:options:error:",  v10,  v8,  0LL,  &v14);
    id v12 = v14;

    id v9 = v12;
    if (!a4) {
      goto LABEL_8;
    }
LABEL_6:
    goto LABEL_8;
  }

  id v11 = 0LL;
  if (a4) {
    goto LABEL_6;
  }
LABEL_8:

LABEL_9:
  return v11;
}

id sub_100304700(id a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"phase",  &off_10040E008));
    v11[0] = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v3));

    v11[1] = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 connection]);
    id v9 = sub_10024C088((uint64_t)&OBJC_CLASS___AppInstallEntity, v8, v7);
    id v2 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  return v2;
}

id sub_100304844(void *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0LL;
  }
  id v4 = a3;
  id v5 = a2;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"phase",  &off_10040E020));
  v22[0] = v18;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"coordinator_id",  v5));
  v21[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"coordinator_id"));
  v20[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v4));

  v20[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  v21[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v11));
  v22[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  id v15 = sub_100304A5C(a1, v14, v5);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

id sub_100304A5C(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
  id v8 = sub_10024C088((uint64_t)&OBJC_CLASS___AppInstallEntity, v7, v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    id v10 = sub_10021B6F4(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      id v12 = (void *)v11;
      id v13 = sub_10021B6F4(v9);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      unsigned __int8 v15 = [v14 isEqual:v5];

      if ((v15 & 1) == 0)
      {
        uint64_t v20 = ASDLogHandleForCategory(35LL);
        SEL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          id v22 = sub_10021B6F4(v9);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          int v24 = 138543874;
          id v25 = v9;
          __int16 v26 = 2114;
          id v27 = v23;
          __int16 v28 = 2114;
          id v29 = v5;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "Matched an installation (%{public}@) with a coordinator ID (%{public}@) that differs from the expected coord inator ID (%{public}@).",  (uint8_t *)&v24,  0x20u);
        }

        goto LABEL_9;
      }
    }

    id v16 = sub_10021B6F4(v9);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    if (!v17)
    {
      uint64_t v18 = ASDLogHandleForCategory(35LL);
      SEL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v24 = 138543618;
        id v25 = v9;
        __int16 v26 = 2114;
        id v27 = v5;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "Matched an installation (%{public}@) that lacks a coordinator ID despite expecting a particular coordinator ID (%{public}@).",  (uint8_t *)&v24,  0x16u);
      }

id sub_100304C48(void *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0LL;
  }
  id v4 = a3;
  id v5 = a2;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"phase",  &off_10040E038));
  v22[0] = v18;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"coordinator_id",  v5));
  v21[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteNullPredicate isNullPredicateWithProperty:]( &OBJC_CLASS___SQLiteNullPredicate,  "isNullPredicateWithProperty:",  @"coordinator_id"));
  v20[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v4));

  v20[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v9));
  v21[1] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAnyPredicates:",  v11));
  v22[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

  id v15 = sub_100304A5C(a1, v14, v5);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

id sub_100304E60(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v8 = 0LL;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000LL;
    uint64_t v11 = sub_100304FB0;
    id v12 = sub_100304FC0;
    id v13 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"phase",  &off_10040E050));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 connection]);
    id v4 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppInstallEntity, v3, v2);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100304FC8;
    void v7[3] = &unk_1003EAAA8;
    v7[4] = v1;
    v7[5] = &v8;
    [v5 enumeratePersistentIDsUsingBlock:v7];
    id v1 = (id)objc_claimAutoreleasedReturnValue([(id)v9[5] allObjects]);

    _Block_object_dispose(&v8, 8);
  }

  return v1;
}

void sub_100304F94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100304FB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100304FC0(uint64_t a1)
{
}

void sub_100304FC8(uint64_t a1, uint64_t a2)
{
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"parent_id",  a2));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  id v5 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppPackageEntity, v4, v12);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  id v9 = -[SQLiteEntity initWithPersistentID:onConnection:](v7, "initWithPersistentID:onConnection:", a2, v8);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_1003050EC;
  v13[3] = &unk_1003EFB50;
  uint64_t v10 = *(void *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  uint64_t v15 = v10;
  uint64_t v11 = v9;
  [v6 enumeratePersistentIDsUsingBlock:v13];
}

void sub_1003050EC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(&OBJC_CLASS___AppPackageEntity);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  id v17 = -[SQLiteEntity initWithPersistentID:onConnection:](v4, "initWithPersistentID:onConnection:", a2, v5);

  id v6 = sub_1001E2798(v17, (uint64_t)@"package_url");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = sub_1001ECB18(v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    -[SQLiteEntity setValue:forProperty:](v17, "setValue:forProperty:", v10, @"package_url");
    id v11 = sub_10021B6D0(*(void **)(a1 + 40));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      id v13 = *(void **)(a1 + 40);
      id v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      id v15 = sub_10021B6D0(v13);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v14 addObject:v16];
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }
}

void sub_100305378(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(double *)(v1 + 16) = sub_1002F92B8((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    uint64_t v2 = ASDLogHandleForCategory(14LL);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v1 + 16);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Diagnostic clock offset updated: %.0f",  (uint8_t *)&v5,  0xCu);
    }
  }

id *sub_1003054A0(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_CLASS___TestFlightServiceHost;
    a1 = (id *)objc_msgSendSuper2(&v23, "init");
    if (a1)
    {
      dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.TestFlightServiceHost.dispatch", v6);
      id v8 = a1[3];
      a1[3] = v7;

      objc_storeStrong(a1 + 2, a2);
      a1[5] = (id)0x404E000000000000LL;
      id v9 = objc_alloc(&OBJC_CLASS___ASDExtensionMonitor);
      v24[0] = NSExtensionPointName;
      v24[1] = NSExtensionIdentifierName;
      v25[0] = ASDTestFlightServiceExtensionPointIdentifier;
      v25[1] = @"com.apple.TestFlight.ServiceExtension";
      void v24[2] = @"ENTITLEMENT:com.apple.private.appstored";
      v25[2] = &off_10040E068;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  3LL));
      id v11 = -[ASDExtensionMonitor initWithAttributes:](v9, "initWithAttributes:", v10);
      id v12 = a1[1];
      a1[1] = v11;

      objc_initWeak(&location, a1);
      id v13 = a1[3];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100305724;
      v19[3] = &unk_1003F2C08;
      objc_copyWeak(&v21, &location);
      id v14 = v13;
      id v20 = v14;
      [a1[1] setUpdateHandler:v19];
      id v15 = (dispatch_queue_s *)a1[3];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100305A20;
      block[3] = &unk_1003E9880;
      a1 = a1;
      uint64_t v18 = a1;
      dispatch_async(v15, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void sub_100305700( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_100305724(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_queue_attr_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003057CC;
    void v7[3] = &unk_1003E9DC0;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void sub_1003057CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) firstObject]);
  sub_10030580C(v1, v2);
}

void sub_10030580C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_queue_attr_t v5 = v4;
  if (a1 && *(id *)(a1 + 32) != v4)
  {
    objc_storeStrong((id *)(a1 + 32), a2);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) testFlightServiceExtensionCustomServiceTime]);
    dispatch_queue_t v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 < 0.0) {
        double v8 = 0.0;
      }
      double v9 = fmin(v8, 300.0);
    }

    else
    {
      double v9 = 60.0;
    }

    *(double *)(a1 + 40) = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    id v11 = [v10 length];

    uint64_t v12 = ASDLogHandleForCategory(39LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
        *(_DWORD *)buf = 138543618;
        id v22 = v15;
        __int16 v23 = 2114;
        int v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "TestFlight service extension: %{public}@ with service time: %{public}@ seconds",  buf,  0x16u);
      }
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "TestFlight service extension: none", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      BOOL v18 = *(void *)(a1 + 32) != 0LL;
      SEL v19 = *(dispatch_queue_s **)(a1 + 16);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      void v20[2] = sub_100306DCC;
      v20[3] = &unk_1003E9E38;
      v20[4] = a1;
      v20[5] = v18;
      dispatch_async(v19, v20);
    }
  }
}

void sub_100305A20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 8) extensions]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  sub_10030580C(v1, v2);
}

uint64_t sub_100305A74(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 24);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100305B0C;
  v4[3] = &unk_1003E9BE0;
  void v4[4] = a1;
  v4[5] = &v5;
  dispatch_async_and_wait(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100305B0C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    uint64_t v1 = *(void *)(v1 + 32) != 0LL;
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = v1;
  return result;
}

void sub_100305B30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = ASDLogHandleForCategory(39LL);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "notifyOfReceivedPushToken", buf, 2u);
    }

    *(void *)buf = 0LL;
    BOOL v18 = buf;
    uint64_t v19 = 0x2810000000LL;
    id v20 = &unk_10039135E;
    char v21 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100305C94;
    v12[3] = &unk_1003F2C58;
    id v13 = v5;
    id v16 = buf;
    uint64_t v14 = a1;
    id v15 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_100305EC0;
    v9[3] = &unk_1003F2C80;
    id v11 = buf;
    v9[4] = a1;
    id v10 = v15;
    sub_100305F8C(a1, v12, v9);

    _Block_object_dispose(buf, 8);
  }
}

void sub_100305C94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100305D98;
  void v10[3] = &unk_1003F2C30;
  objc_copyWeak(&v12, &location);
  __int128 v9 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v9;
  __int128 v11 = v9;
  void v10[4] = *(void *)(a1 + 40);
  [v5 didReceivePushToken:v7 reply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_100305D7C(_Unwind_Exception *a1)
{
}

void sub_100305D98(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained endRequest];

  uint64_t v7 = (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  do
    unsigned __int8 v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    __int128 v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100305E74;
      block[3] = &unk_1003F03E8;
      id v13 = v9;
      char v14 = a2;
      id v12 = v5;
      dispatch_async(v10, block);
    }
  }
}

void sub_100305E74(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = ASDErrorWithSafeUserInfo(*(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v4);
}

void sub_100305EC0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 32LL);
  do
    unsigned __int8 v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    id v6 = (void *)a1[5];
    if (v6)
    {
      uint64_t v7 = *(dispatch_queue_s **)(a1[4] + 16LL);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      void v8[2] = sub_100305F78;
      v8[3] = &unk_1003E9D48;
      id v10 = v6;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t sub_100305F78(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_100305F8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(dispatch_queue_s **)(a1 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100306E20;
  block[3] = &unk_1003F2CF8;
  void block[4] = a1;
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  dispatch_async(v7, block);
}

void sub_10030603C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = ASDLogHandleForCategory(39LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "notifyOfReceivedPushMessages", buf, 2u);
    }

    *(void *)buf = 0LL;
    BOOL v18 = buf;
    uint64_t v19 = 0x2810000000LL;
    id v20 = &unk_10039135E;
    char v21 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003061A0;
    v12[3] = &unk_1003F2C58;
    id v13 = v5;
    id v16 = buf;
    uint64_t v14 = a1;
    id v15 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_1003063CC;
    v9[3] = &unk_1003F2C80;
    id v11 = buf;
    v9[4] = a1;
    id v10 = v15;
    sub_100305F8C(a1, v12, v9);

    _Block_object_dispose(buf, 8);
  }
}

void sub_1003061A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_1003062A4;
  void v10[3] = &unk_1003F2C30;
  objc_copyWeak(&v12, &location);
  __int128 v9 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v9;
  __int128 v11 = v9;
  void v10[4] = *(void *)(a1 + 40);
  [v5 didReceivePushMessages:v7 reply:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_100306288(_Unwind_Exception *a1)
{
}

void sub_1003062A4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained endRequest];

  uint64_t v7 = (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  do
    unsigned __int8 v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    __int128 v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100306380;
      block[3] = &unk_1003F03E8;
      id v13 = v9;
      char v14 = a2;
      id v12 = v5;
      dispatch_async(v10, block);
    }
  }
}

void sub_100306380(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = ASDErrorWithSafeUserInfo(*(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v4);
}

void sub_1003063CC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 32LL);
  do
    unsigned __int8 v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    id v6 = (void *)a1[5];
    if (v6)
    {
      uint64_t v7 = *(dispatch_queue_s **)(a1[4] + 16LL);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      void v8[2] = sub_100306484;
      v8[3] = &unk_1003E9D48;
      id v10 = v6;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t sub_100306484(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_100306498(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = ASDLogHandleForCategory(39LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2114;
      id v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "notifyOfReachedTerminalPhaseWithBetaBundle: %{public}@, phase: %{public}ld, error: %{public}@",  buf,  0x20u);
    }

    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2810000000LL;
    id v25 = &unk_10039135E;
    char v26 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10030669C;
    v17[3] = &unk_1003F2CA8;
    id v18 = v9;
    uint64_t v23 = a3;
    id v19 = v10;
    id v22 = buf;
    uint64_t v20 = a1;
    id v21 = v11;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1003068DC;
    void v14[3] = &unk_1003F2C80;
    id v16 = buf;
    v14[4] = a1;
    id v15 = v21;
    sub_100305F8C(a1, v17, v14);

    _Block_object_dispose(buf, 8);
  }
}

void sub_10030669C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, v6);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003067B4;
  v12[3] = &unk_1003F2C30;
  objc_copyWeak(&v14, &location);
  __int128 v11 = *(_OWORD *)(a1 + 56);
  id v10 = (id)v11;
  __int128 v13 = v11;
  void v12[4] = *(void *)(a1 + 48);
  [v5 didReachTerminalPhaseWithBetaBundle:v8 terminalPhase:v7 error:v9 reply:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_100306798(_Unwind_Exception *a1)
{
}

void sub_1003067B4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained endRequest];

  uint64_t v7 = (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  do
    unsigned __int8 v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100306890;
      block[3] = &unk_1003F03E8;
      id v13 = v9;
      char v14 = a2;
      id v12 = v5;
      dispatch_async(v10, block);
    }
  }
}

void sub_100306890(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = ASDErrorWithSafeUserInfo(*(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v4);
}

void sub_1003068DC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 32LL);
  do
    unsigned __int8 v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    id v6 = (void *)a1[5];
    if (v6)
    {
      uint64_t v7 = *(dispatch_queue_s **)(a1[4] + 16LL);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      void v8[2] = sub_100306994;
      v8[3] = &unk_1003E9D48;
      id v10 = v6;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t sub_100306994(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_1003069A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = ASDLogHandleForCategory(39LL);
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "reloadAppsFromServerWithCompletionHandler",  buf,  2u);
    }

    *(void *)buf = 0LL;
    id v13 = buf;
    uint64_t v14 = 0x2810000000LL;
    id v15 = &unk_10039135E;
    char v16 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_100306AE4;
    v9[3] = &unk_1003F2CD0;
    __int128 v11 = buf;
    v9[4] = a1;
    id v10 = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_100306D00;
    v6[3] = &unk_1003F2C80;
    unsigned __int8 v8 = buf;
    void v6[4] = a1;
    id v7 = v10;
    sub_100305F8C(a1, v9, v6);

    _Block_object_dispose(buf, 8);
  }
}

void sub_100306AE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_100306BD8;
  v9[3] = &unk_1003F2C30;
  objc_copyWeak(&v11, &location);
  __int128 v8 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v8;
  __int128 v10 = v8;
  v9[4] = *(void *)(a1 + 32);
  [v5 reloadAppsFromServerWithReply:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void sub_100306BBC(_Unwind_Exception *a1)
{
}

void sub_100306BD8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained endRequest];

  id v7 = (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  do
    unsigned __int8 v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      __int128 v10 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100306CB4;
      block[3] = &unk_1003F03E8;
      id v13 = v9;
      char v14 = a2;
      id v12 = v5;
      dispatch_async(v10, block);
    }
  }
}

void sub_100306CB4(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = ASDErrorWithSafeUserInfo(*(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v4);
}

void sub_100306D00(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 32LL);
  do
    unsigned __int8 v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    id v6 = (void *)a1[5];
    if (v6)
    {
      id v7 = *(dispatch_queue_s **)(a1[4] + 16LL);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      void v8[2] = sub_100306DB8;
      v8[3] = &unk_1003E9D48;
      id v10 = v6;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t sub_100306DB8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_100306DCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
    id WeakRetained = 0LL;
  }

  id v5 = WeakRetained;
  [WeakRetained testFlightServiceHost:v4 didUpdateExtensionStatus:*(void *)(a1 + 40)];
}

void sub_100306E20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = *(void **)(v1 + 32);
    if (v5)
    {
      id v6 = v5;
      id v7 = [[ASDExtensionRequest alloc] initWithExtension:v6 queue:*(void *)(v1 + 24) serviceTime:*(double *)(v1 + 40) graceTime:1.0];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      void v15[2] = sub_100306FB4;
      v15[3] = &unk_1003F2D20;
      v15[4] = v1;
      id v16 = v4;
      [v7 setErrorBlock:v15];
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___ASDTestFlightServiceExtensionHostContext, v8);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100306FFC;
      v12[3] = &unk_1003F2D48;
      void v12[4] = v1;
      id v13 = v7;
      id v14 = v3;
      id v10 = v7;
      [v10 beginRequestForHostContext:v9 XPCInterface:&OBJC_PROTOCOL___ASDTestFlightServiceExtensionRemoteXPCInterface executionBlock:v12];
    }

    else
    {
      uint64_t v11 = ASDErrorWithDescription(ASDTestFlightServiceErrorDomain, 512LL, @"Extension not available");
      id v6 = (id)objc_claimAutoreleasedReturnValue(v11);
      (*((void (**)(id, id))v4 + 2))(v4, v6);
    }
  }
}

void sub_100306FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = ASDErrorWithSafeUserInfo(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
}

uint64_t sub_100306FFC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  a2,  *(void *)(a1 + 40));
}

AppInstallInstallTask *sub_10030705C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v29 = a5;
  id v10 = a4;
  objc_opt_self(a1);
  uint64_t v11 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
  id v13 = -[SQLiteEntity initWithPersistentID:onConnection:](v11, "initWithPersistentID:onConnection:", a2, v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SQLiteEntity setValue:forProperty:](v13, "setValue:forProperty:", v14, @"timestamp");

  v32[0] = @"alternate_icon_name";
  v32[1] = @"approved";
  v32[2] = @"arcade";
  v32[3] = @"auto_install_override";
  v32[4] = @"bundle_id";
  v32[5] = @"bundle_url";
  v32[6] = @"client_id";
  v32[7] = @"client_type";
  v32[8] = @"coordinator_id";
  v32[9] = @"download_path";
  v32[10] = @"download_volume";
  v32[11] = @"evid";
  v32[12] = @"external_id";
  v32[13] = @"install_volume";
  v32[14] = @"item_id";
  v32[15] = @"log_code";
  v32[16] = @"receipt";
  v32[17] = @"software_platform";
  v32[18] = @"source_type";
  v32[19] = @"store_cohort";
  v32[20] = @"store_metadata";
  v32[21] = @"storefront";
  v32[22] = @"update_type";
  v32[23] = @"vendor_name";
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 24LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity memoryEntityForPersistentID:withProperties:usingConnection:]( &OBJC_CLASS___AppInstallEntity,  "memoryEntityForPersistentID:withProperties:usingConnection:",  a2,  v15,  v16));

  v31[0] = @"archive_type";
  v31[1] = @"dp_info";
  v31[2] = @"extracted_content_size";
  v31[3] = @"package_type";
  v31[4] = @"package_url";
  v31[5] = @"provisioning_profiles";
  v31[6] = @"sinf";
  v31[7] = @"variant_id";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 8LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity memoryEntityForPersistentID:withProperties:usingConnection:]( &OBJC_CLASS___AppPackageEntity,  "memoryEntityForPersistentID:withProperties:usingConnection:",  a3,  v18,  v19));
  id v21 = objc_alloc(&OBJC_CLASS___AppInstallInstallTask);
  id v22 = v17;
  id v23 = v20;
  id v24 = v29;
  if (v21)
  {
    v30.receiver = v21;
    v30.super_class = (Class)&OBJC_CLASS___AppInstallInstallTask;
    id v25 = objc_msgSendSuper2(&v30, "init");
    id v21 = (AppInstallInstallTask *)v25;
    if (v25)
    {
      objc_storeStrong((id *)v25 + 5, a5);
      objc_storeStrong((id *)&v21->super._error, v17);
      objc_storeStrong((id *)&v21->_install, v20);
      char v26 = -[LogKey initWithAppInstallMemoryEntity:]( objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey),  "initWithAppInstallMemoryEntity:",  v22);
      coordinator = v21->_coordinator;
      v21->_coordinator = (IXAppInstallCoordinator *)v26;
    }
  }

  return v21;
}

id *sub_1003082D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_opt_self(a1);
  id v6 = sub_1003083F0((id *)objc_alloc(&OBJC_CLASS___AppInstallInstallResponse), a2, (void *)2, v5);

  return v6;
}

id sub_100308334(id a1, NSString *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v2,  0LL);

  return v3;
}

id *sub_1003083F0(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_CLASS___AppInstallInstallResponse;
    uint64_t v9 = (id *)objc_msgSendSuper2(&v11, "init");
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v9[3] = a3;
      objc_storeStrong(v9 + 2, a4);
    }
  }

  return a1;
}

id sub_1003085D4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030864C;
  block[3] = &unk_1003E9EA8;
  void block[4] = objc_opt_self(a1);
  if (qword_1004627F8 != -1) {
    dispatch_once(&qword_1004627F8, block);
  }
  return (id)qword_1004627F0;
}

void sub_10030864C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1004627F0;
  qword_1004627F0 = (uint64_t)v1;
}

void sub_100308670(void *a1, void *a2)
{
  if (a1)
  {
    id v18 = a2;
    id v3 = a2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = (void *)sub_10026FCC0(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v7));
          objc_initWeak(&location, a1);
          uint64_t v9 = (void *)a1[1];
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472LL;
          void v11[2] = sub_100308AC0;
          void v11[3] = &unk_1003F2D90;
          objc_copyWeak(&v12, &location);
          [v9 addNotificationRequest:v8 withCompletionHandler:v11];
          objc_destroyWeak(&v12);
          objc_destroyWeak(&location);

          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
      }

      while (v5);
    }
  }

void sub_100308834( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t sub_10030899C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100308AC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(9LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v11 = 138543618;
      id v12 = (id)objc_opt_class(WeakRetained, v8);
      __int16 v13 = 2114;
      id v14 = v3;
      id v9 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Failed to post notification. Error: %{public}@",  (uint8_t *)&v11,  0x16u);
LABEL_6:
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v11 = 138543362;
    id v12 = (id)objc_opt_class(WeakRetained, v10);
    id v9 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Notification posted successfully",  (uint8_t *)&v11,  0xCu);
    goto LABEL_6;
  }
}

AppInstallPostambleTask *sub_100308C1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_opt_self(a1);
  v21[0] = @"automatic_type";
  v21[1] = @"bundle_id";
  void v21[2] = @"bundle_url";
  v21[3] = @"coordinator_intent";
  v21[4] = @"client_id";
  v21[5] = @"download_volume";
  v21[6] = @"external_id";
  v21[7] = @"has_background_assets_extension";
  v21[8] = @"metrics_install_type";
  v21[9] = @"post_processing_state";
  v21[10] = @"previous_galette_mode";
  v21[11] = @"receipt";
  v21[12] = @"redownload";
  v21[13] = @"restore_type";
  v21[14] = @"source_type";
  v21[15] = @"update_type";
  v21[16] = @"account_id";
  v21[17] = @"item_id";
  v21[18] = @"transaction_id";
  v21[19] = @"log_code";
  v21[20] = @"external_id";
  v21[21] = @"store_cohort";
  v21[22] = @"storefront";
  v21[23] = @"vendor_name";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 24LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity memoryEntityForPersistentID:withProperties:usingConnection:]( &OBJC_CLASS___AppInstallEntity,  "memoryEntityForPersistentID:withProperties:usingConnection:",  a2,  v7,  v8));

  uint64_t v20 = @"archive_type";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity memoryEntityForPersistentID:withProperties:usingConnection:]( &OBJC_CLASS___AppPackageEntity,  "memoryEntityForPersistentID:withProperties:usingConnection:",  a3,  v10,  v11));
  __int16 v13 = objc_alloc(&OBJC_CLASS___AppInstallPostambleTask);
  id v14 = v9;
  id v15 = v12;
  if (v13)
  {
    v19.receiver = v13;
    v19.super_class = (Class)&OBJC_CLASS___AppInstallPostambleTask;
    __int128 v16 = (AppInstallPostambleTask *)objc_msgSendSuper2(&v19, "init");
    __int16 v13 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->super._error, v9);
      objc_storeStrong((id *)&v13->_sourceType, v12);
      *(void *)&v13->super._success = sub_1001E2698(v13->super._error, (uint64_t)@"automatic_type");
      v13->_automaticType = (int64_t)sub_1001E2698(v13->super._error, (uint64_t)@"restore_type");
      v13->_install = (AppInstall *)sub_1001E2698(v13->super._error, (uint64_t)@"source_type");
      v13->_restoreType = (int64_t)sub_1001E2698(v13->super._error, (uint64_t)@"update_type");
    }
  }

  return v13;
}

void sub_100309714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_100309734(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ASDLogHandleForCategory(2LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Failed to notify Game Center of app install: %{public}@",  (uint8_t *)&v7,  0x16u);
    }
  }
}

Class sub_100309840(uint64_t a1)
{
  id v5 = 0LL;
  uint64_t v2 = (const char *)&unk_100462000;
  if (!qword_100462808)
  {
    __int128 v6 = off_1003F2E00;
    uint64_t v7 = 0LL;
    qword_100462808 = _sl_dlopen(&v6, &v5);
    id v3 = v5;
    if (!qword_100462808)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }

    if (v5) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    uint64_t v2 = "GKScopedIdManager";
    Class result = objc_getClass("GKScopedIdManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    id v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }

  qword_100462800 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_100309944(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  else {
    uint64_t v4 = sub_1001E880C((uint64_t)v3, 18007LL, &stru_1003F2E18);
  }

  return v4;
}

void sub_1003099AC(id a1, SQLiteDatabaseStoreMigrator *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    sub_1002E981C((uint64_t)v2, @"DROP TABLE app_done", 0, 0LL);
    sub_1002E981C((uint64_t)v2, @"DROP TABLE app_install", 0, 0LL);
    sub_1002E981C((uint64_t)v2, @"DROP TABLE app_install_remote", 0, 0LL);
    sub_1002E981C((uint64_t)v2, @"DROP TABLE app_package", 0, 0LL);
    sub_1002E981C( (uint64_t)v2,  @"CREATE TABLE IF NOT EXISTS app_done (pid INTEGER, account_id INTEGER, item_id INTEGER, machine_based INTEGER NOT NULL DEFAULT 0, request_url URL, transaction_id TEXT, PRIMARY KEY(pid));",
      1,
      0LL);
    sub_1002E981C( (uint64_t)v2,  @"CREATE TABLE IF NOT EXISTS app_install (pid INTEGER, account_id INTEGER, apple_id TEXT, arcade INTEGER NOT NULL DEFAULT 0, alt_dsid TEXT, alternate_icon_name TEXT, approved INTEGER NOT NULL DEFAULT 0, artwork_url URL, auto_install_override INTEGER NOT NULL DEFAULT 0, automatic_type INTEGER NOT NULL DEFAULT 0, bundle_id TEXT, bundle_name TEXT, bundle_url URL, bundle_version TEXT, bootstrapped INTEGER NOT NULL DEFAULT 2, cancel_download_url URL, cancel_if_duplicate INTEGER NOT NULL DEFAULT 0, companion_bundle_id TEXT, client_id TEXT, client_type INTEGER NOT NULL DEFAULT 0, coordinator_id UUID, coordinator_intent INTEGER NOT NULL DEFAULT 1, default_browser INTEGER NOT NULL DEFAULT 0, device_based_vpp INTEGER, downloader_id INTEGER, download_path TEXT, download_volume TEXT, external_id UUID, external_order INTEGER, evid INTEGER, failure_error BLOB, gizmo_pairing_id UUID, has_background_assets_extension INTEGER NOT NULL DEFAULT 0, has_messages_extension INTEGER NOT NULL DEFAULT 0, install_finished_timestamp DATETIME, install_verification_token TEXT, install_volume TEXT, item_id INTEGER, last_start_date DATETIME, launch_prohibited INTEGER NOT NULL DEFAULT 0, log_code TEXT, messages_artwork_url URL, metrics_fields JSON, optimal_download_start INTEGER, metrics_install_type INTEGER NOT NULL DEFAULT 0, order_index INTEGER, phase INTEGER NOT NULL DEFAULT 10, policy JSON, placeholder_entitlements BLOB, placeholder_path TEXT, post_processing_state INTEGER NOT NULL DEFAULT 0, previous_galette_mode INTEGER, priority INTEGER NOT NULL DEFAULT 0, quarantine INTEGER NOT NULL DEFAULT 0, receipt BLOB, recovery_count INTEGER NOT NULL DEFAULT 0, redownload INTEGER NOT NULL DEFAULT 0, remote_install INTEGER NOT NULL DEFAULT 0, requires_rosetta INTEGER NOT NULL DEFAULT 0, restore_state INTEGER NOT NULL DEFAULT 0, restore_retry_count INTEGER NOT NULL DEFAULT 0, restore_type INTEGER NOT NULL DEFAULT 0, runs_on_apple_silicon INTEGER NOT NULL DEFAULT 1, runs_on_intel INTEGER NOT NULL DEFAULT 1,software_platform INTEGER NOT NULL DEFAULT 0, source_type INTEGER NOT NULL DEFAULT 0, storefront TEXT, store_cohort TEXT, store_metadata BLOB, supports_32bit_only INTEGER NOT NULL DEFAULT 0, supress_dialogs INTEGER NOT NULL DEFAULT 0, timestamp DATETIME DEFAULT (timestamp()), transaction_id TEXT, update_type INTEGER NOT NULL DEFAULT 0, vid UUID, vendor_name TEXT, watch_type INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(pid));",
      1,
      0LL);
    sub_1002E981C( (uint64_t)v2,  @"CREATE TABLE IF NOT EXISTS app_install_remote (pid INTEGER, destination_id TEXT, external_id UUID, metadata BLOB, PRIMARY KEY(pid));",
      1,
      0LL);
    sub_1002E981C( (uint64_t)v2,  @"CREATE TABLE IF NOT EXISTS app_package (pid INTEGER, archive_type INTEGER NOT NULL DEFAULT 0, background_asset_metadata JSON, blocked INTEGER NOT NULL DEFAULT 0, bytes_offset INTEGER, bytes_remaining INTEGER, bytes_total INTEGER, clear_hash_array JSON, compression INTEGER NOT NULL DEFAULT 0, data_promise_id UUID, delta_algorithm TEXT, disk_usage INTEGER, dp_info BLOB, extracted_content_size INTEGER, hash_array JSON, hash_size INTEGER, hash_type INTEGER, hole_punch_size INTEGER, initial_odr_size INTEGER, locate_asset_cache INTEGER, odr_manifest_url URL, package_type INTEGER, package_url URL, parent_id UUID, provisioning_profiles JSON, ranges_not_supported INTEGER DEFAULT 0, request_count INTEGER DEFAULT 0, sinf BLOB, streaming_zip INTEGER, timestamp DATETIME DEFAULT (timestamp()), variant_id TEXT, PRIMARY KEY(pid));",
      1,
      0LL);
  }
}

id *sub_100309A94(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_CLASS___LoadStoreQueueTask;
    __int16 v13 = (id *)objc_msgSendSuper2(&v15, "init");
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 11, a3);
      a1[7] = a2;
      objc_storeStrong(a1 + 6, a4);
      objc_storeStrong(a1 + 5, a5);
    }
  }

  return a1;
}

id sub_10030A870(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 88);
  if (!v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_activeiTunesAccount"));
    id v5 = *(void **)(a1 + 88);
    *(void *)(a1 + 8_Block_object_dispose(va, 8) = v4;

    uint64_t v2 = *(void **)(a1 + 88);
  }

  return v2;
}

uint64_t sub_10030A8DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  uint64_t v6 = v5 != 0LL;
  if (v5)
  {
    id v7 = v5;
    BOOL v18 = v5 != 0LL;
    char v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v12 = objc_alloc(&OBJC_CLASS___AppDoneEntity);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
        id v14 = -[SQLiteEntity initWithPropertyValues:onConnection:]( v12,  "initWithPropertyValues:onConnection:",  v11,  v13);

        v8 |= v14 != 0LL;
      }

      id v7 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);

    if ((v8 & 1) == 0)
    {
      uint64_t v6 = 0LL;
      goto LABEL_15;
    }

    if (v3)
    {
      id v16 = objc_getProperty(v3, v15, 24LL, 1);
      id v4 = v16;
      if (v16) {
        *((_BYTE *)v16 + 137) = 1;
      }
    }

    else
    {
      id v4 = 0LL;
    }

    uint64_t v6 = v18;
  }

LABEL_15:
  return v6;
}

id *sub_10030AB0C(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___PurchaseHistoryHideShowRequest;
    char v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

void sub_10030ABB4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(void **)(a1 + 16);
    if (!v5) {
      goto LABEL_27;
    }
    id v6 = objc_getProperty(v5, v3, 16LL, 1);
    if (!v6) {
      goto LABEL_27;
    }
    char v8 = v6;
    id Property = *(id *)(a1 + 16);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 16LL, 1);
    }
    id v10 = Property;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_DSID"));

    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 8);
      id v46 = 0LL;
      id v13 = sub_100255E30(v12, (uint64_t)@"purchase-daap/base-url", &v46);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = v46;
      if (v14
        && (id v16 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"databases/%ld/items/edit",  sub_1002560B8(*(id **)(a1 + 8), (uint64_t)@"purchase-daap/database-id", 101)),  v17 = (void *)objc_claimAutoreleasedReturnValue(v16),  v18 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:v17]),  v17,  v14,  v18))
      {
        id v19 = 0LL;
      }

      else
      {
        uint64_t v20 = ASDLogHandleForCategory(14LL);
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v40 = (void *)objc_opt_class(a1, v22);
          *(_DWORD *)buf = 138412546;
          id v48 = v40;
          __int16 v49 = 2114;
          id v50 = v15;
          id v41 = v40;
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "[%@]: Failed to construct request URL error: %{public}@",  buf,  0x16u);
        }

        id v23 = sub_1001DD5A0(2LL, (uint64_t)v15);
        id v19 = (id)objc_claimAutoreleasedReturnValue(v23);
        BOOL v18 = 0LL;
      }

      id v24 = v19;
      if (v18)
      {
        char v26 = objc_alloc(&OBJC_CLASS___PurchaseHistoryHideShowRequestEncoder);
        id v27 = *(id *)(a1 + 16);
        if (v27) {
          id v27 = objc_getProperty(v27, v25, 8LL, 1);
        }
        id v28 = v27;
        id v29 = sub_10022195C(v26, v28);

        id v31 = sub_1002AF430((id *)objc_alloc(&OBJC_CLASS___DAAPURLRequest), v29, v18);
        id v32 = *(id *)(a1 + 16);
        if (v32) {
          id v32 = objc_getProperty(v32, v30, 16LL, 1);
        }
        id v34 = v32;
        if (v31) {
          objc_setProperty_atomic(v31, v33, v34, 24LL);
        }

        id v36 = *(id *)(a1 + 16);
        if (v36) {
          id v36 = objc_getProperty(v36, v35, 24LL, 1);
        }
        id v38 = v36;
        if (v31) {
          objc_setProperty_atomic(v31, v37, v38, 40LL);
        }

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        void v44[2] = sub_10030AF50;
        v44[3] = &unk_1003EBDF8;
        id v45 = v4;
        sub_1002AF4C8((uint64_t)v31, v44);
      }

      else
      {
        id v39 = sub_1001DD5A0(2LL, (uint64_t)v24);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(v39);
        (*((void (**)(id, void *))v4 + 2))(v4, v29);
      }
    }

    else
    {
LABEL_27:
      id v42 = sub_1001DD5A0(4LL, 0LL);
      id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      (*((void (**)(id, void *))v4 + 2))(v4, v43);
    }
  }
}

void sub_10030AF50(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = (uint64_t)v5;
    goto LABEL_5;
  }

  if ((char *)[v15 responseStatusCode] - 300 <= (char *)0xFFFFFFFFFFFFFF9BLL)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = 1LL;
    uint64_t v8 = 0LL;
LABEL_5:
    id v9 = sub_1001DD5A0(v6, v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
    goto LABEL_8;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v15 data]);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v11)
  {
    id v10 = (void *)v11;
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0LL);
  }

  else
  {
    id v13 = sub_1001DD5A0(0LL, 0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

    id v10 = 0LL;
  }

id *sub_10030B08C(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_CLASS___RequestBrokerClient;
    id v4 = (id *)objc_msgSendSuper2(&v21, "init");
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      id v5 = -[XPCClient initWithConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithConnection:", v3);
      id v6 = a1[1];
      a1[1] = v5;

      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
      id v8 = a1[4];
      a1[4] = v7;

      id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[1] clientID]);
      id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.appstored.RequestBrokerClient.%@", v9));
      uint64_t v11 = (const char *)[v10 UTF8String];
      dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_queue_t v16 = dispatch_queue_create_with_target_V2(v11, v13, v15);

      __int128 v17 = (id *)a1[4];
      if (v17) {
        [v17[1] setUnderlyingQueue:v16];
      }
      BOOL v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      id v19 = a1[3];
      a1[3] = v18;
    }
  }

  return a1;
}

void sub_10030B200(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained invalidate];
  }

void sub_10030B234(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = ASDLogHandleForCategory(14LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543618;
      id v8 = v3;
      __int16 v9 = 2114;
      uint64_t v10 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Queued task: %{public}@ for: %{public}@",  (uint8_t *)&v7,  0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      [*(id *)(v6 + 8) addOperation:v3];
    }
  }
}

BOOL sub_10030B450(id a1, AppInstallsDatabaseTransaction *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"source_type",  &off_10040D318));
  v14[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"IFNULL(app_install.phase, 10)",  &off_10040E080));
  v14[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v5));

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppInstallsDatabaseSession connection](v2, "connection"));
  id v8 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppInstallEntity, v7, v6);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10030B5D8;
  v12[3] = &unk_1003EB4C8;
  id v13 = v2;
  uint64_t v10 = v2;
  [v9 enumeratePersistentIDsUsingBlock:v12];

  return 1;
}

void sub_10030B5D8(uint64_t a1, uint64_t a2)
{
}

id sub_10030B7EC(uint64_t a1)
{
  if (qword_100462818 != -1) {
    dispatch_once(&qword_100462818, &stru_1003F2E58);
  }
  return (id)qword_100462810;
}

void sub_10030B830(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___PurchaseService);
  uint64_t v2 = (void *)qword_100462810;
  qword_100462810 = (uint64_t)v1;
}

void sub_10030BC48(void *a1)
{
  uint64_t v2 = ASDLogHandleForCategory(14LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_opt_class(a1[4], v4);
    uint64_t v6 = (void *)a1[5];
    id v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 processInfo]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    int v15 = 138412546;
    dispatch_queue_t v16 = v5;
    __int16 v17 = 2114;
    BOOL v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[%@]: Checking server queue for clientID: %{public}@",  (uint8_t *)&v15,  0x16u);
  }

  if ((objc_opt_respondsToSelector(*(void *)(a1[4] + 32LL), "checkStoreQueue:") & 1) != 0)
  {
    [*(id *)(a1[4] + 32) checkStoreQueue:a1[6]];
  }

  else
  {
    uint64_t v10 = ASDLogHandleForCategory(14LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_opt_class(a1[4], v12);
      int v15 = 138412290;
      dispatch_queue_t v16 = v13;
      id v14 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[%@]: selector not implemented",  (uint8_t *)&v15,  0xCu);
    }
  }

void sub_10030BED4(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(14LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_opt_class(*(void *)(a1 + 32), v4);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(a1 + 48);
    id v8 = v5;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 processInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    *(_DWORD *)buf = 138412802;
    char v26 = v5;
    __int16 v27 = 2114;
    uint64_t v28 = v7;
    __int16 v29 = 2114;
    objc_super v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[%@]: Notify dialog complete for purchaseID %{public}@ clientID: %{public}@",  buf,  0x20u);
  }

  if ((objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 32LL),  "notifyDialogCompleteForPurchaseID:result:selectedButton:withResultHandler:") & 1) != 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v11 + 32);
    uint64_t v14 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 64);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_10030C0F4;
    v21[3] = &unk_1003F2E80;
    v21[4] = v11;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    char v24 = *(_BYTE *)(a1 + 72);
    [v13 notifyDialogCompleteForPurchaseID:v12 result:v14 selectedButton:v15 withResultHandler:v21];
  }

  else
  {
    uint64_t v16 = ASDLogHandleForCategory(14LL);
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v19 = (void *)objc_opt_class(*(void *)(a1 + 32), v18);
      *(_DWORD *)buf = 138412290;
      char v26 = v19;
      id v20 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[%@]: selector not implemented",  buf,  0xCu);
    }
  }

void sub_10030C0F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = (void *)objc_opt_class(*(void *)(a1 + 32), v8);
      uint64_t v10 = *(void **)(a1 + 40);
      id v11 = v9;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 processInfo]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
      int v21 = 138412802;
      id v22 = v9;
      __int16 v23 = 2114;
      char v24 = v13;
      __int16 v25 = 2114;
      id v26 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[%@]: Notify dialog completed for clientID: %{public}@ with error: %{public}@",  (uint8_t *)&v21,  0x20u);
LABEL_6:
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_opt_class(*(void *)(a1 + 32), v14);
    uint64_t v16 = *(void **)(a1 + 40);
    id v11 = v15;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 processInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    int v21 = 138412546;
    id v22 = v15;
    __int16 v23 = 2114;
    char v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@]: Notify dialog completed successfully for client: %{public}@ ",  (uint8_t *)&v21,  0x16u);
    goto LABEL_6;
  }

  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v19 = ASDErrorWithSafeUserInfo(v4);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, v18, v20);
}

void sub_10030C3A4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  uint64_t v8 = *(void *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  id v4 = *(void **)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10030C4A0;
  v5[3] = &unk_1003F2ED0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  [v2 processPurchases:v3 failBatchOnError:0 requestToken:v6 withReplyHandler:v5];
}

void sub_10030C4A0(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  __int16 v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_opt_class(a1[4], v10);
      uint64_t v12 = (void *)a1[5];
      id v13 = v11;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 processInfo]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
      int v22 = 138412802;
      __int16 v23 = v11;
      __int16 v24 = 2114;
      __int16 v25 = v15;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%@]: Purchase completed for clientID: %{public}@ with error: %{public}@",  (uint8_t *)&v22,  0x20u);
LABEL_6:
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)objc_opt_class(a1[4], v16);
    uint64_t v18 = (void *)a1[5];
    id v13 = v17;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v18 processInfo]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    int v22 = 138412546;
    __int16 v23 = v17;
    __int16 v24 = 2114;
    __int16 v25 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@]: Purchase completed successfully for client %{public}@",  (uint8_t *)&v22,  0x16u);
    goto LABEL_6;
  }

  uint64_t v19 = a1[6];
  uint64_t v20 = ASDErrorWithSafeUserInfo(v5);
  int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  (*(void (**)(uint64_t, id, void *))(v19 + 16))(v19, v6, v21);
}

void sub_10030C75C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 32);
  id v5 = *(void **)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_10030C804;
  v6[3] = &unk_1003F2ED0;
  void v6[4] = v2;
  id v7 = v5;
  id v8 = *(id *)(a1 + 56);
  [v4 processPurchases:v3 failBatchOnError:1 requestToken:v7 withReplyHandler:v6];
}

void sub_10030C804(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  __int16 v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_opt_class(a1[4], v10);
      uint64_t v12 = (void *)a1[5];
      id v13 = v11;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 processInfo]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
      int v22 = 138412802;
      __int16 v23 = v11;
      __int16 v24 = 2114;
      __int16 v25 = v15;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%@] Purchases completed for client: %{public}@ with error: %{public}@",  (uint8_t *)&v22,  0x20u);
LABEL_6:
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)objc_opt_class(a1[4], v16);
    uint64_t v18 = (void *)a1[5];
    id v13 = v17;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v18 processInfo]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    int v22 = 138412546;
    __int16 v23 = v17;
    __int16 v24 = 2114;
    __int16 v25 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] Purchases completed successfully for client: %{public}@",  (uint8_t *)&v22,  0x16u);
    goto LABEL_6;
  }

  uint64_t v19 = a1[6];
  uint64_t v20 = ASDErrorWithSafeUserInfo(v5);
  int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  (*(void (**)(uint64_t, id, void *))(v19 + 16))(v19, v6, v21);
}

void sub_10030CAE0(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v3 = ASDLogHandleForCategory(14LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = v2;
    __int16 v29 = 2114;
    objc_super v30 = v6;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@] Batch purchase started client: %{public}@ itemIDs: [%{public}@]",  buf,  0x20u);
  }

  id v8 = objc_alloc(&OBJC_CLASS____TtC9appstored23PurchaseArcadeBatchTask);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processInfo]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  id v13 = -[PurchaseArcadeBatchTask initWithItemIDs:additionalBuyParams:client:logKey:]( v8,  "initWithItemIDs:additionalBuyParams:client:logKey:",  v10,  v9,  v12,  v2);

  id v14 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
  uint64_t v15 = (id *)objc_claimAutoreleasedReturnValue(v14);
  __int16 v26 = v13;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  if (v15) {
    [v15[1] addOperations:v16 waitUntilFinished:1];
  }

  if (v13
    && (id v18 = objc_getProperty(v13, v17, 32LL, 1)) != 0LL
    && (uint64_t v19 = *(void *)(a1 + 56), v18, v19))
  {
    uint64_t v21 = *(void *)(a1 + 56);
    id v22 = objc_getProperty(v13, v20, 32LL, 1);
    (*(void (**)(uint64_t, void, id))(v21 + 16))(v21, 0LL, v22);
  }

  else
  {
    uint64_t v23 = *(void *)(a1 + 56);
    if (!v23) {
      goto LABEL_12;
    }
    id v22 = (id)objc_claimAutoreleasedReturnValue(-[PurchaseArcadeBatchTask purchaseResponse](v13, "purchaseResponse"));
    (*(void (**)(uint64_t, id, void))(v23 + 16))(v23, v22, 0LL);
  }

LABEL_12:
  uint64_t v24 = ASDLogHandleForCategory(14LL);
  __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v2;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%@] Batch purchase complete", buf, 0xCu);
  }
}

void sub_10030CE90(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allKeys]);
  uint64_t v4 = ASDLogHandleForCategory(14LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) processInfo]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 138412802;
    __int16 v29 = v2;
    __int16 v30 = 2114;
    __int16 v31 = v7;
    __int16 v32 = 2114;
    id v33 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%@] Batch purchase started client: %{public}@ itemIDs: [%{public}@]",  buf,  0x20u);
  }

  uint64_t v9 = objc_alloc(&OBJC_CLASS____TtC9appstored23PurchaseArcadeBatchTask);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) processInfo]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  id v14 = -[PurchaseArcadeBatchTask initWithItemMetadata:additionalBuyParams:client:logKey:]( v9,  "initWithItemMetadata:additionalBuyParams:client:logKey:",  v11,  v10,  v13,  v2);

  id v15 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
  uint64_t v16 = (id *)objc_claimAutoreleasedReturnValue(v15);
  id v27 = v14;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  if (v16) {
    [v16[1] addOperations:v17 waitUntilFinished:1];
  }

  if (v14
    && (id v19 = objc_getProperty(v14, v18, 32LL, 1)) != 0LL
    && (uint64_t v20 = *(void *)(a1 + 56), v19, v20))
  {
    uint64_t v22 = *(void *)(a1 + 56);
    id v23 = objc_getProperty(v14, v21, 32LL, 1);
    (*(void (**)(uint64_t, void, id))(v22 + 16))(v22, 0LL, v23);
  }

  else
  {
    uint64_t v24 = *(void *)(a1 + 56);
    if (!v24) {
      goto LABEL_12;
    }
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[PurchaseArcadeBatchTask purchaseResponse](v14, "purchaseResponse"));
    (*(void (**)(uint64_t, id, void))(v24 + 16))(v24, v23, 0LL);
  }

LABEL_12:
  uint64_t v25 = ASDLogHandleForCategory(14LL);
  __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v29 = v2;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%@] Batch purchase complete", buf, 0xCu);
  }
}

void sub_10030D234(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(14LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_opt_class(*(void *)(a1 + 32), v4);
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v8 = v5;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 itemID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) bundleID]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) processInfo]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    *(_DWORD *)buf = 138413314;
    uint64_t v21 = v5;
    __int16 v22 = 2114;
    uint64_t v23 = v7;
    __int16 v24 = 2114;
    uint64_t v25 = v9;
    __int16 v26 = 2114;
    id v27 = v10;
    __int16 v28 = 2114;
    __int16 v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ Starting purchase of %{public}@:%{public}@ by %{public}@",  buf,  0x34u);
  }

  id v13 = *(void **)(*(void *)(a1 + 32) + 32LL);
  uint64_t v19 = *(void *)(a1 + 48);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10030D428;
  v16[3] = &unk_1003F2ED0;
  id v15 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  id v17 = v15;
  id v18 = *(id *)(a1 + 56);
  [v13 processPurchases:v14 failBatchOnError:0 requestToken:v17 withReplyHandler:v16];
}

void sub_10030D428(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = (void *)objc_opt_class(a1[4], v10);
      uint64_t v25 = a1[5];
      int v27 = 138412802;
      __int16 v28 = v24;
      __int16 v29 = 2114;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      id v32 = v6;
      id v26 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%@]: %{public}@ Purchase completed with error: %{public}@",  (uint8_t *)&v27,  0x20u);
    }

    id v11 = [[ASDPurchaseResult alloc] initWithSuccess:0 error:v6];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_opt_class(a1[4], v12);
      uint64_t v14 = a1[5];
      int v27 = 138412546;
      __int16 v28 = v13;
      __int16 v29 = 2114;
      uint64_t v30 = v14;
      id v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ Purchase completed successfully",  (uint8_t *)&v27,  0x16u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

    id v18 = objc_alloc(&OBJC_CLASS___ASDPurchaseResult);
    id v19 = [v17 success];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 error]);
    id v11 = [v18 initWithSuccess:v19 error:v20];
  }

  uint64_t v21 = a1[6];
  uint64_t v22 = ASDErrorWithSafeUserInfo(v6);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  (*(void (**)(uint64_t, id, void *))(v21 + 16))(v21, v11, v23);
}

id sub_10030D714(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 propertyValues]);
    id v6 = objc_alloc(&OBJC_CLASS___AccountEventEntity);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
    id v8 = -[SQLiteEntity initWithPropertyValues:onConnection:](v6, "initWithPropertyValues:onConnection:", v5, v7);

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v8, "persistentID")));
    }

    else
    {
      uint64_t v10 = ASDLogHandleForCategory(14LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543362;
        uint64_t v14 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to create account event entity with: %{public}@",  (uint8_t *)&v13,  0xCu);
      }

      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

id sub_10030D868(void *a1, void *a2, objc_class *a3, void *a4)
{
  id v6 = a2;
  if (a1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v24 = v6;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          int v13 = objc_autoreleasePoolPush();
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 propertyValues]);
          id v15 = objc_alloc(a3);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
          id v17 = [v15 initWithPropertyValues:v14 onConnection:v16];

          if (!v17)
          {

            objc_autoreleasePoolPop(v13);
            goto LABEL_12;
          }

          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 persistentID]));
          [v7 addObject:v18];

          objc_autoreleasePoolPop(v13);
        }

        id v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

id sub_10030DA74(void *a1, void *a2, void *a3)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v23 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          uint64_t v12 = objc_autoreleasePoolPush();
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 propertyValues]);
          uint64_t v14 = objc_alloc(&OBJC_CLASS___AppMetricsEventEntity);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
          uint64_t v16 = -[SQLiteEntity initWithPropertyValues:onConnection:]( v14,  "initWithPropertyValues:onConnection:",  v13,  v15);

          if (!v16)
          {

            objc_autoreleasePoolPop(v12);
            goto LABEL_12;
          }

          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v16, "persistentID")));
          [v5 addObject:v17];

          objc_autoreleasePoolPop(v12);
        }

        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

id sub_10030DC7C(void *a1, void *a2, objc_class *a3, void *a4)
{
  id v5 = a2;
  if (a1)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v27 = v5;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v30 = *(void *)v34;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          uint64_t v10 = objc_autoreleasePoolPush();
          id v11 = sub_1002C860C(v9);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          int v13 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v12));

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
          id v15 = sub_10024C088((uint64_t)&OBJC_CLASS___AppMetadataEntity, v14, v13);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertyValues", v27));
          id v18 = objc_alloc(a3);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
          id v20 = [v18 initWithPropertyValues:v17 onConnection:v19];

          if (!v20)
          {

            objc_autoreleasePoolPop(v10);
            goto LABEL_14;
          }

          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v20 persistentID]));
          [v32 addObject:v21];

          objc_autoreleasePoolPop(v10);
        }

        id v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

id sub_10030DF24(id a1, void *a2, void *a3)
{
  id v4 = a2;
  id v40 = a1;
  if (a1)
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v35 = v4;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v39 = *(void *)v42;
      id v7 = (objc_class *)&OBJC_METACLASS___TestFlightUploadSubTask;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v42 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          uint64_t v10 = objc_autoreleasePoolPush();
          id v11 = sub_1001D2DA0(v9);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          id v13 = [v12 length];

          if (v13)
          {
            id v14 = sub_1001D2DA0(v9);
            id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v15));

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v40 connection]);
            id v18 = sub_10024C088((uint64_t)&v7[85], v17, v16);
            id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

            id v20 = v7;
            id v21 = objc_alloc(v7 + 85);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 propertyValues]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v40 connection]);
            id v24 = [v21 initWithPropertyValues:v22 onConnection:v23];

            if (!v24)
            {
              uint64_t v27 = ASDLogHandleForCategory(14LL);
              __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v33 = sub_1001D2DA0(v9);
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                *(_DWORD *)buf = 138543362;
                id v46 = v34;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Error creating app usage sessionentity for bundleID: %{public}@",  buf,  0xCu);
              }

              objc_autoreleasePoolPop(v10);
              goto LABEL_20;
            }

            id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v24 persistentID]));
            [v38 addObject:v25];

            id v7 = v20;
          }

          else
          {
            uint64_t v26 = ASDLogHandleForCategory(14LL);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v9;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "Dropping app install meatadata due to no bundleID: %@",  buf,  0xCu);
            }
          }

          objc_autoreleasePoolPop(v10);
        }

        id v6 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

id sub_10030E2BC(void *a1, void *a2, void *a3)
{
  id v4 = a2;
  if (a1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v51 = v4;
    id v6 = v4;
    id v55 = [v6 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v55)
    {
      uint64_t v54 = *(void *)v57;
      id v7 = (objc_class *)&OBJC_METACLASS___AppEventEntityCrossfire;
      id v53 = a1;
      while (2)
      {
        for (i = 0LL; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v57 != v54) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
          uint64_t v10 = objc_autoreleasePoolPush();
          id v11 = sub_1002CFD24(v9);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          id v13 = [v12 length];

          if (v13)
          {
            id v14 = sub_1002CFD24(v9);
            id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v15));

            id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
            id v18 = sub_10024C088((uint64_t)&v7[485], v17, v16);
            id v19 = (id)objc_claimAutoreleasedReturnValue(v18);

            if (v19)
            {
              id v20 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  sub_1002D011C(v9));
              id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
              [v19 setValue:v21 forProperty:@"event_source"];

              id v22 = sub_1002CFD48(v9);
              id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              [v19 setValue:v23 forProperty:@"launch_start_time"];

              if (sub_1002CFE64(v9))
              {
                id v24 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1002CFE64(v9));
                id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                [v19 setValue:v25 forProperty:@"is_extension"];
              }

              id v26 = sub_1002CFEC8(v9);
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

              if (v27)
              {
                id v28 = sub_1002CFEC8(v9);
                id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
                [v19 setValue:v29 forProperty:@"containing_bundle_id"];
              }

              id v30 = sub_1002D015C(v9);
              __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

              if (v31)
              {
                id v32 = sub_1002D015C(v9);
                id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
                [v19 setValue:v33 forProperty:@"payload"];
              }
            }

            else
            {
              id v35 = objc_alloc(v7 + 485);
              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v9 propertyValues]);
              uint64_t v37 = objc_claimAutoreleasedReturnValue([a1 connection]);
              id v38 = v6;
              uint64_t v39 = v5;
              id v40 = (void *)v37;
              id v19 = [v35 initWithPropertyValues:v36 onConnection:v37];

              id v5 = v39;
              id v6 = v38;

              if (!v19)
              {
                uint64_t v42 = ASDLogHandleForCategory(14LL);
                __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  id v49 = sub_1002CFD24(v9);
                  id v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                  *(_DWORD *)buf = 138543362;
                  id v61 = v50;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Error creating entity for bundleID: %{public}@",  buf,  0xCu);
                }

                objc_autoreleasePoolPop(v10);
                id v6 = v38;
                goto LABEL_25;
              }
            }

            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend(v19, "persistentID", v51)));
            [v5 addObject:v41];

            a1 = v53;
            id v7 = (objc_class *)&OBJC_METACLASS___AppEventEntityCrossfire;
          }

          else
          {
            uint64_t v34 = ASDLogHandleForCategory(14LL);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v61 = v9;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "Dropping event due to no bundleID: %@",  buf,  0xCu);
            }
          }

          objc_autoreleasePoolPop(v10);
        }

        id v55 = [v6 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v55) {
          continue;
        }
        break;
      }
    }

id sub_10030E79C(void *a1, void *a2)
{
  id v3 = a2;
  id v40 = v3;
  if (a1)
  {
    id v4 = v3;
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v44;
      p_cache = (objc_class *)&OBJC_CLASS___SQLiteNullPredicate.cache;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
          id v11 = objc_autoreleasePoolPush();
          id v12 = sub_1002CFD24(v10);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          id v14 = [v13 length];

          if (v14)
          {
            id v15 = sub_1002CFD24(v10);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v16));

            id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
            id v19 = sub_10024C088((uint64_t)&p_cache[493], v18, v17);
            id v20 = (id)objc_claimAutoreleasedReturnValue(v19);

            if (v20)
            {
              id v21 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  sub_1002D011C(v10));
              id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
              [v20 setValue:v22 forProperty:@"event_source"];

              id v23 = sub_1002CFD48(v10);
              id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              [v20 setValue:v24 forProperty:@"launch_start_time"];

              id v25 = sub_1002CFDA8(v10);
              id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              [v20 setValue:v26 forProperty:@"launch_end_time"];
            }

            else
            {
              id v28 = objc_alloc(p_cache + 493);
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 propertyValues]);
              id v30 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
              id v20 = [v28 initWithPropertyValues:v29 onConnection:v30];

              if (!v20)
              {
                uint64_t v32 = ASDLogHandleForCategory(14LL);
                id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  id v38 = sub_1002CFD24(v10);
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  *(_DWORD *)buf = 138543362;
                  id v48 = v39;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Error creating entity for bundleID: %{public}@",  buf,  0xCu);
                }

                objc_autoreleasePoolPop(v11);
                goto LABEL_20;
              }
            }

            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v20 persistentID]));
            [v42 addObject:v31];

            p_cache = (objc_class *)(&OBJC_CLASS___SQLiteNullPredicate + 16);
          }

          else
          {
            uint64_t v27 = ASDLogHandleForCategory(14LL);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v48 = v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "Dropping event due to no bundleID: %@",  buf,  0xCu);
            }
          }

          objc_autoreleasePoolPop(v11);
        }

        id v6 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

id sub_10030EBA4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
    id v11 = 0LL;
    goto LABEL_10;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 propertyValues]);
  id v6 = [v4 databaseID];
  uint64_t v7 = objc_alloc(&OBJC_CLASS___LaunchEventSyncMetadataEntity);
  if (!v6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
    uint64_t v10 = -[SQLiteEntity initWithPropertyValues:onConnection:](v7, "initWithPropertyValues:onConnection:", v5, v12);

    if (v10) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v13 = ASDLogHandleForCategory(14LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543362;
      id v17 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unable to launch sync metadata entity with: %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    id v11 = 0LL;
    goto LABEL_9;
  }

  id v8 = [v4 databaseID];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 connection]);
  uint64_t v10 = -[SQLiteEntity initWithPersistentID:onConnection:](v7, "initWithPersistentID:onConnection:", v8, v9);

  -[SQLiteEntity setValuesWithDictionary:](v10, "setValuesWithDictionary:", v5);
  if (!v10) {
    goto LABEL_6;
  }
LABEL_4:
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[SQLiteEntity persistentID](v10, "persistentID")));
LABEL_9:

LABEL_10:
  return v11;
}

void sub_10030ED70(uint64_t a1)
{
  uint64_t v1 = objc_opt_self(a1);
  id v2 = sub_1002F8C58((uint64_t)&OBJC_CLASS___AppDefaultsManager, @"LastWeeklyAnalyticsPostDate");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (!v3 || ([v3 timeIntervalSinceNow], v5 <= -604800.0))
  {
    uint64_t v6 = ASDLogHandleForCategory(9LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Recording weekly analytics events",  (uint8_t *)v18,  2u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    sub_1002F8D94((uint64_t)&OBJC_CLASS___AppDefaultsManager, v8, @"LastWeeklyAnalyticsPostDate");

    v27[0] = @"AutomaticDownloads";
    uint64_t v9 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  sub_1002FA52C((uint64_t)&OBJC_CLASS___AppDefaultsManager));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v27[1] = @"AutomaticUpdates";
    v28[0] = v10;
    id v11 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  sub_1002FA098((uint64_t)&OBJC_CLASS___AppDefaultsManager));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v28[1] = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
    id v14 = [v13 mutableCopy];

    sub_10030F080(v1, v14, 40LL);
    objc_opt_self(v1);
    uint64_t v23 = 0LL;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    uint64_t v26 = 0LL;
    uint64_t v19 = 0LL;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v22 = 0LL;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10030F1D0;
    v18[3] = &unk_1003F2F00;
    v18[4] = &v19;
    v18[5] = &v23;
    +[ApplicationProxy enumerateApplicationsOfType:usingBlock:]( &OBJC_CLASS___ApplicationProxy,  "enumerateApplicationsOfType:usingBlock:",  0LL,  v18);
    v29[0] = @"appStoreAppsCount";
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v24[3]));
    v29[1] = @"testFlightCount";
    v30[0] = v15;
    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20[3]));
    v30[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
    sub_10030F080(v1, v17, 19LL);
  }
}

void sub_10030F054( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10030F080(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_self(a1);
  uint64_t v7 = sub_10030F184(v6, a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_10030F1C8;
  void v10[3] = &unk_1003ED990;
  id v11 = v5;
  id v9 = v5;
  AnalyticsSendEventLazy(v8, v10);
}

void sub_10030F124(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_self(a1);
  uint64_t v7 = sub_10030F184(v6, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  AnalyticsSendEventLazy(v8, v5);
}

CFStringRef sub_10030F184(uint64_t a1, uint64_t a2)
{
  else {
    return off_1003F2F20[a2 - 2];
  }
}

id sub_10030F1C8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10030F1D0(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isBeta])
  {
    id v3 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    id v4 = v6;
LABEL_5:
    ++*v3;
    goto LABEL_6;
  }

  unsigned int v5 = [v6 isStoreOriginated];
  id v4 = v6;
  if (v5)
  {
    id v3 = (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    goto LABEL_5;
  }

id sub_10030F240(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030F2B8;
  block[3] = &unk_1003E9EA8;
  void block[4] = objc_opt_self(a1);
  if (qword_100462838 != -1) {
    dispatch_once(&qword_100462838, block);
  }
  return (id)qword_100462830;
}

void sub_10030F2B8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100462830;
  qword_100462830 = (uint64_t)v1;
}

void sub_10030F38C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    unsigned int v5 = *(dispatch_queue_s **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_10030F418;
    v6[3] = &unk_1003E9DC0;
    void v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void sub_10030F418(uint64_t a1)
{
}

void sub_10030F424(void *a1, void *a2)
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_95;
  }
  uint64_t v4 = ASDLogHandleForCategory(19LL);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      id v7 = objc_getProperty(v3, v6, 184LL, 1);
      id v9 = objc_getProperty(v3, v8, 104LL, 1);
      id Property = objc_getProperty(v3, v10, 112LL, 1);
      uint64_t v12 = v9;
      id v13 = v7;
    }

    else
    {
      id v9 = 0LL;
      uint64_t v12 = 0LL;
      id v7 = 0LL;
      id v13 = 0LL;
      id Property = 0LL;
    }

    id v14 = Property;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    v132 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%@] ODR Download requested for %{public}@ : %{public}@",  buf,  0x20u);
  }

  id v15 = v3;
  objc_opt_self(&OBJC_CLASS___ODRPlatformPolicies);
  else {
    unint64_t v16 = 0x80000000LL;
  }
  uint64_t v17 = ASDLogHandleForCategory(19LL);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v135 = 136446466;
    *(void *)&v135[4] = "-[ODRDownloadManager _hasExceededMaxPinnedResources:]";
    *(_WORD *)&v135[12] = 2048;
    *(void *)&v135[14] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}s ODRDownloadManager._hasExceededMaxPinnedResources maxPinnedSizeAllowed %lul",  v135,  0x16u);
  }

  *(void *)v135 = 0LL;
  *(void *)&v135[8] = v135;
  *(void *)&v135[16] = 0x2020000000LL;
  uint64_t v136 = 0LL;
  id v19 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 3221225472LL;
  *(void *)&uint8_t buf[16] = sub_100315CF0;
  v132 = &unk_1003EB858;
  v134 = v135;
  id v21 = v15;
  id v133 = v21;
  [v20 readUsingSession:buf];

  if (*(void *)(*(void *)&v135[8] + 24LL) > v16)
  {
    uint64_t v22 = ASDLogHandleForCategory(19LL);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      if (v21) {
        id v94 = objc_getProperty(v21, v24, 184LL, 1);
      }
      else {
        id v94 = 0LL;
      }
      id v95 = v94;
      uint64_t v96 = *(void *)(*(void *)&v135[8] + 24LL);
      *(_DWORD *)v125 = 138412802;
      id v126 = v95;
      __int16 v127 = 2048;
      uint64_t v128 = v96;
      __int16 v129 = 2048;
      unint64_t v130 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "[%@] Pin exceeded maximum pinned assets limit (%lu > %lu)",  v125,  0x20u);
    }

    _Block_object_dispose(v135, 8);
    uint64_t v25 = ASDLogHandleForCategory(19LL);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v21) {
        id v28 = objc_getProperty(v21, v27, 184LL, 1);
      }
      else {
        id v28 = 0LL;
      }
      id v29 = v28;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@]: resource request exceeds maximum limit.",  buf,  0xCu);
    }

    NSErrorUserInfoKey v123 = NSLocalizedDescriptionKey;
    v124 = @"Request for resource exceeds maximum limit.";
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  &v123,  1LL));
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4993LL,  v30));
    sub_100258268((uint64_t)v21, v31);

    goto LABEL_95;
  }

  _Block_object_dispose(v135, 8);
  if (!sub_100313E48((BOOL)a1, v21))
  {
    uint64_t v37 = v21;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100462820);
    uint64_t v39 = (_BYTE *)qword_100462828;
    if (qword_100462828)
    {
      if (v37) {
        id v40 = objc_getProperty(v37, v38, 240LL, 1);
      }
      else {
        id v40 = 0LL;
      }
      id v41 = v40;
      uint64_t v39 = (_BYTE *)objc_claimAutoreleasedReturnValue([v39 objectForKey:v41]);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100462820);

    if (v39)
    {
      if ((v39[80] & 1) == 0 || v37 && (v37[80] & 1) != 0)
      {
        uint64_t v64 = ASDLogHandleForCategory(19LL);
        uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          if (v37) {
            id v67 = objc_getProperty(v37, v66, 184LL, 1);
          }
          else {
            id v67 = 0LL;
          }
          id v68 = v67;
          id v70 = objc_getProperty(v39, v69, 184LL, 1);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v68;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v70;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "[%@]: request is a duplicate of [%{public}@]",  buf,  0x16u);
        }

        sub_1002581AC((uint64_t)v39, v37);
        goto LABEL_94;
      }

      uint64_t v42 = ASDLogHandleForCategory(19LL);
      __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = objc_getProperty(v39, v44, 184LL, 1);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[%@]: Restarting prefetch download as non-discretionary",  buf,  0xCu);
      }

      id v47 = objc_getProperty(v39, v46, 96LL, 1);
      [v47 cancel];
    }

    id v48 = v37;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100462820);
    id v50 = (void *)qword_100462828;
    if (!qword_100462828)
    {
      uint64_t v51 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
      id v52 = (void *)qword_100462828;
      qword_100462828 = v51;

      id v50 = (void *)qword_100462828;
    }

    if (v48) {
      id v53 = objc_getProperty(v48, v49, 240LL, 1);
    }
    else {
      id v53 = 0LL;
    }
    id v54 = v53;
    [v50 setObject:v48 forKey:v54];

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100462820);
    sub_10018BE7C((uint64_t)&OBJC_CLASS___ODRAssetDownload, v48);

    id v55 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
    __int128 v57 = (void *)v56;
    if (v48)
    {
      char v58 = sub_1001C9AF4(v56, v48[19]);

      if ((v58 & 1) != 0)
      {
        id v60 = objc_getProperty(v48, v59, 216LL, 1);
        goto LABEL_42;
      }
    }

    else
    {
      char v106 = sub_1001C9AF4(v56, 0LL);

      if ((v106 & 1) != 0)
      {
        id v60 = 0LL;
LABEL_42:
        id v61 = v60;
        unsigned int v62 = [v61 isFileURL];

        if (v62)
        {
          objc_initWeak((id *)buf, a1);
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472LL;
          v118[2] = sub_100314418;
          v118[3] = &unk_1003F30E0;
          objc_copyWeak(&v120, (id *)buf);
          v119 = v48;
          sub_100258B78((uint64_t)v119, v118);

          objc_destroyWeak(&v120);
          objc_destroyWeak((id *)buf);
        }

        else
        {
          if (v48 && v48[18]) {
            goto LABEL_79;
          }
          uint64_t v71 = ASDLogHandleForCategory(19LL);
          id v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            if (v48) {
              id v74 = objc_getProperty(v48, v73, 184LL, 1);
            }
            else {
              id v74 = 0LL;
            }
            id v75 = v74;
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v75;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "[%@] No download size, attempting to look it up",  buf,  0xCu);
          }

          self = objc_alloc(&OBJC_CLASS___DetermineSizeForURLTask);
          if (v48)
          {
            id v77 = objc_getProperty(v48, v76, 216LL, 1);
            id v79 = objc_getProperty(v48, v78, 184LL, 1);
          }

          else
          {
            id v77 = 0LL;
            id v79 = 0LL;
          }

          id v80 = v79;
          selfa = sub_10025D76C((id *)&self->super.super.super.isa, v77, v80);

          if (v48)
          {
            if ((v48[10] & 1) != 0) {
              uint64_t v81 = 9LL;
            }
            else {
              uint64_t v81 = 25LL;
            }
          }

          else
          {
            uint64_t v81 = 25LL;
          }

          sub_1001E2F40((uint64_t)&OBJC_CLASS___ODRTaskQueue, selfa, v81, 1LL);
          id v83 = selfa;
          if (selfa) {
            id v83 = objc_getProperty(selfa, v82, 32LL, 1);
          }
          id v84 = v83;

          if (v84)
          {
            uint64_t v86 = ASDLogHandleForCategory(19LL);
            v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              if (v48) {
                id v89 = objc_getProperty(v48, v88, 184LL, 1);
              }
              else {
                id v89 = 0LL;
              }
              id v91 = v89;
              id v92 = selfa;
              if (selfa) {
                id v92 = objc_getProperty(selfa, v90, 32LL, 1);
              }
              id v93 = v92;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v91;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v93;
              _os_log_error_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_ERROR,  "[%@] Error fetching size: %{public}@",  buf,  0x16u);
            }
          }

          else
          {
            id v97 = selfa;
            if (selfa) {
              id v97 = objc_getProperty(selfa, v85, 72LL, 1);
            }
            id v98 = v97;
            id v99 = [v98 integerValue];
            if (v48) {
              v48[18] = (uint64_t)v99;
            }

            id v100 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
            v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
            v116[0] = _NSConcreteStackBlock;
            v116[1] = 3221225472LL;
            v116[2] = sub_100314470;
            v116[3] = &unk_1003E9858;
            v117 = v48;
            [v101 modifyUsingTransaction:v116];

            v87 = v117;
          }

          if (v48) {
LABEL_79:
          }
            id v102 = objc_getProperty(v48, v63, 200LL, 1);
          else {
            id v102 = 0LL;
          }
          id v103 = v102;
          unsigned int v104 = [v103 isCancelled];

          if (v104)
          {
            v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3072LL,  0LL));
            sub_100313F34((uint64_t)a1, v48, v105);
          }

          else
          {
            sub_100314480(a1, v48);
          }
        }

LABEL_94:
        goto LABEL_95;
      }
    }

    uint64_t v107 = ASDLogHandleForCategory(19LL);
    v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      if (v48) {
        id v110 = objc_getProperty(v48, v109, 184LL, 1);
      }
      else {
        id v110 = 0LL;
      }
      id v111 = v110;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v111;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "[%@]: There was not enough space available to download the requested resource.",  buf,  0xCu);
    }

    NSErrorUserInfoKey v121 = NSLocalizedFailureReasonErrorKey;
    v122 = @"There was not enough space available to download the requested On Demand Resources.";
    v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v122,  &v121,  1LL));
    v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4992LL,  v112));
    sub_100313F34((uint64_t)a1, v48, v113);

    goto LABEL_94;
  }

  uint64_t v32 = ASDLogHandleForCategory(19LL);
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (v21) {
      id v35 = objc_getProperty(v21, v34, 184LL, 1);
    }
    else {
      id v35 = 0LL;
    }
    id v36 = v35;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[%@]: Expected asset already exists.",  buf,  0xCu);
  }

  sub_100313F34((uint64_t)a1, v21, 0LL);
LABEL_95:
}

void sub_100310094( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id location)
{
}

void sub_1003100D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10031017C;
    block[3] = &unk_1003E97D0;
    id v9 = v5;
    id v10 = v6;
    uint64_t v11 = a1;
    dispatch_async(v7, block);
  }
}

void sub_10031017C(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(19LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received request to cancel download requests for %{public}@ - %{public}@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  id v34 = sub_100310498;
  id v35 = sub_1003104A8;
  id v36 = 0LL;
  id v6 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  void v27[2] = sub_1003104B0;
  v27[3] = &unk_1003E9B90;
  id v29 = buf;
  id v28 = *(id *)(a1 + 32);
  [v7 modifyUsingTransaction:v27];

  id v8 = sub_1003105D8(*(void *)(a1 + 48), *(void **)(*(void *)&buf[8] + 40LL));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v12);
        uint64_t v14 = ASDLogHandleForCategory(19LL);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v13) {
            id Property = objc_getProperty(v13, v16, 184LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v18 = Property;
          *(_DWORD *)id v30 = 138412290;
          id v31 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@]: Canceling download request",  v30,  0xCu);
        }

        if (v13) {
          id v20 = objc_getProperty(v13, v19, 96LL, 1);
        }
        else {
          id v20 = 0LL;
        }
        id v21 = v20;
        [v21 cancel];

        sub_1003107A0(*(void *)(a1 + 48), v13);
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v22 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
      id v10 = v22;
    }

    while (v22);
  }

  _Block_object_dispose(buf, 8);
}

void sub_100310460(_Unwind_Exception *a1)
{
}

uint64_t sub_100310498(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1003104A8(uint64_t a1)
{
}

uint64_t sub_1003104B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_1001878BC(v3, *(void **)(a1 + 32));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        sub_1001C3F28((BOOL)v3, *(void **)(*((void *)&v14 + 1) + 8LL * (void)v12));
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  return 1LL;
}

id sub_1003105D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100462820);
    if (qword_100462828)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v5 = v3;
      id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
            uint64_t v11 = (void *)qword_100462828;
            id v12 = sub_10018BDB4(v10);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v13, (void)v20));

            if (v14)
            {
              -[NSMutableArray addObject:](v4, "addObject:", v14);
              __int128 v15 = (void *)qword_100462828;
              id v16 = sub_10018BDB4(v10);
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              [v15 removeObjectForKey:v17];
            }
          }

          id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v7);
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100462820);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v4));
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

void sub_1003107A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v5 = sub_1002586C4(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    unsigned int v7 = [v4 fileExistsAtPath:v6];

    if (v7)
    {
      uint64_t v8 = sub_1002586C4(v3);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v22 = 0LL;
      [v4 removeItemAtPath:v9 error:&v22];
      id v10 = v22;

      uint64_t v11 = ASDLogHandleForCategory(19LL);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          if (v3) {
            id Property = objc_getProperty(v3, v14, 184LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v16 = (os_log_s *)Property;
          *(_DWORD *)buf = 138412546;
          __int128 v24 = v16;
          __int16 v25 = 2114;
          id v26 = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[%@]: Error removing download from scratch directory: %{public}@",  buf,  0x16u);
LABEL_16:
        }
      }

      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (v3) {
          id v21 = objc_getProperty(v3, v20, 184LL, 1);
        }
        else {
          id v21 = 0LL;
        }
        id v16 = (os_log_s *)v21;
        *(_DWORD *)buf = 138412290;
        __int128 v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@]: Successfully removed download from scratch directory",  buf,  0xCu);
        goto LABEL_16;
      }
    }

    else
    {
      uint64_t v17 = ASDLogHandleForCategory(19LL);
      id v10 = (id)objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_18:

        goto LABEL_19;
      }

      if (v3) {
        id v19 = objc_getProperty(v3, v18, 184LL, 1);
      }
      else {
        id v19 = 0LL;
      }
      id v13 = (os_log_s *)v19;
      *(_DWORD *)buf = 138412290;
      __int128 v24 = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEBUG,  "[%@]: No download files to remove, skipping.",  buf,  0xCu);
    }

    goto LABEL_18;
  }

void sub_1003109F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unsigned int v7 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100310A9C;
    block[3] = &unk_1003E97D0;
    id v9 = v5;
    id v10 = v6;
    uint64_t v11 = a1;
    dispatch_async(v7, block);
  }
}

void sub_100310A9C(uint64_t a1)
{
  uint64_t v2 = ASDLogHandleForCategory(19LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received request to pause download requests for %{public}@ - %{public}@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  id v34 = sub_100310498;
  id v35 = sub_1003104A8;
  id v36 = 0LL;
  id v6 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  void v27[2] = sub_100310DAC;
  v27[3] = &unk_1003E9B90;
  id v29 = buf;
  id v28 = *(id *)(a1 + 40);
  [v7 modifyUsingTransaction:v27];

  id v8 = sub_1003105D8(*(void *)(a1 + 48), *(void **)(*(void *)&buf[8] + 40LL));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v12);
        uint64_t v14 = ASDLogHandleForCategory(19LL);
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v13) {
            id Property = objc_getProperty(v13, v16, 184LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v18 = Property;
          *(_DWORD *)id v30 = 138412290;
          id v31 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@]: Pausing download request",  v30,  0xCu);
        }

        if (v13) {
          id v20 = objc_getProperty(v13, v19, 96LL, 1);
        }
        else {
          id v20 = 0LL;
        }
        id v21 = v20;
        [v21 cancel];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v22 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
      id v10 = v22;
    }

    while (v22);
  }

  _Block_object_dispose(buf, 8);
}

void sub_100310D74(_Unwind_Exception *a1)
{
}

uint64_t sub_100310DAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100187A78(v3, *(void *)(a1 + 32), 1LL);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        sub_1001C50FC((uint64_t)v3, 1LL, *(void **)(*((void *)&v14 + 1) + 8LL * (void)v12));
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  return 1LL;
}

void sub_100310EDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unsigned int v7 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100310F84;
    block[3] = &unk_1003E97D0;
    id v9 = v5;
    id v10 = v6;
    uint64_t v11 = a1;
    dispatch_async(v7, block);
  }
}

void sub_100310F84(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v3 = ASDLogHandleForCategory(19LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v2;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v37 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@]: Received request to resume download requests for %{public}@ - %{public}@",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  uint64_t v37 = sub_100310498;
  id v38 = sub_1003104A8;
  uint64_t v39 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v7 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  void v26[2] = sub_100311338;
  v26[3] = &unk_1003F3068;
  id v27 = *(id *)(a1 + 40);
  id v28 = *(id *)(a1 + 32);
  id v9 = v2;
  id v29 = v9;
  id v30 = buf;
  [v8 modifyUsingTransaction:v26];

  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) firstObject]);
    id v12 = v10;
    if (v10) {
      id Property = objc_getProperty(v10, v11, 128LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v14 = Property;

    uint64_t v15 = ASDLogHandleForCategory(19LL);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v32 = 138412546;
      id v33 = v9;
      __int16 v34 = 2114;
      id v35 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@]: Recreating promises on resume request for %{public}@",  v32,  0x16u);
    }

    sub_100311530(*(void *)(a1 + 48), *(void **)(*(void *)&buf[8] + 40LL), v14, v9);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v17 = *(id *)(*(void *)&buf[8] + 40LL);
    id v18 = [v17 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v17);
          }
          sub_10030F424(*(void **)(a1 + 48), *(void **)(*((void *)&v22 + 1) + 8LL * (void)i));
        }

        id v18 = [v17 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }

      while (v18);
    }
  }

  else
  {
    uint64_t v21 = ASDLogHandleForCategory(19LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v32 = 138412290;
      id v33 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "[%@]: No paused initial requests found",  v32,  0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
}

void sub_100311300(_Unwind_Exception *a1)
{
}

uint64_t sub_100311338(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100187A78(v3, *(void *)(a1 + 32), 1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ([v5 count])
  {
    id v6 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, *(void **)(a1 + 40));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v7 = sub_100188344(v3, v25);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v24 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          sub_1001C50FC((uint64_t)v3, 0LL, v14);
          id v15 = sub_10018BCEC(v14);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          id v17 = sub_100187D90(v3, (uint64_t)v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          if (v18) {
            BOOL v19 = v8 == 0LL;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19)
          {
            id v20 = sub_1002578E0((uint64_t)&OBJC_CLASS___ODRAssetDownloadRequest, v18, v8, v25, *(void **)(a1 + 48));
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            id v22 = sub_10018BD74(v14);
            if (v21) {
              v21[29] = v22;
            }
            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:", v21, v24);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v11);
    }

    uint64_t v5 = v24;
  }

  return 1LL;
}

void sub_100311530(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v42 = 0LL;
    id v10 = sub_1001E4798((uint64_t)&OBJC_CLASS___IXAppInstallCoordinator, v8, (uint64_t)&v42);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v42;
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = ASDLogHandleForCategory(19LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v46 = v9;
        __int16 v47 = 2114;
        id v48 = v8;
        __int16 v49 = 2114;
        id v50 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%@]: Error fetching coordinator with ID %{public}@: %{public}@",  buf,  0x20u);
      }
    }

    else
    {
      id v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v16 = v7;
      id v17 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v39;
        do
        {
          id v20 = 0LL;
          do
          {
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v20);
            if (v21 && v21[29] == 1LL)
            {
              id v22 = sub_100258910(v21);
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              if (v23) {
                -[os_log_s addObject:](v15, "addObject:", v23);
              }
            }

            id v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }

        while (v18);
      }

      id v37 = 0LL;
      unsigned __int8 v24 = sub_1001E5E38(v11, v15, &v37);
      id v13 = v37;
      if (v13)
      {
        uint64_t v25 = ASDLogHandleForCategory(19LL);
        __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "[%@]: Error setting initial ODR promises",  buf,  0xCu);
        }
      }

      if ((v24 & 1) == 0)
      {
        uint64_t v27 = ASDLogHandleForCategory(19LL);
        __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[%@]: Setting initial ODR promises failed, canceling promises",  buf,  0xCu);
        }

        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v15 = v15;
        id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v34;
          do
          {
            uint64_t v32 = 0LL;
            do
            {
              if (*(void *)v34 != v31) {
                objc_enumerationMutation(v15);
              }
              objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)v32), "setComplete:", 1, (void)v33);
              uint64_t v32 = (char *)v32 + 1;
            }

            while (v30 != v32);
            id v30 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
          }

          while (v30);
        }
      }
    }
  }
}

void sub_1003118AC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100311908;
    block[3] = &unk_1003E9880;
    void block[4] = a1;
    dispatch_async(v1, block);
  }

void sub_100311908(uint64_t a1)
{
  id v1 = sub_10018C06C((uint64_t)&OBJC_CLASS___ODRAssetDownload);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v115 objects:v128 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v116;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v116 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)i);
        id v10 = sub_10018BCC8(v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v11));

        if (!v12) {
          id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        }
        -[NSMutableArray addObject:](v12, "addObject:", v9);
        id v13 = sub_10018BCC8(v9);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v14);
      }

      id v6 = [v4 countByEnumeratingWithState:&v115 objects:v128 count:16];
    }

    while (v6);
  }

  id v73 = v4;

  id v80 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v81 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v83 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v82 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v74 = (void *)objc_claimAutoreleasedReturnValue(+[LSDatabaseContext sharedDatabaseContext](&OBJC_CLASS___LSDatabaseContext, "sharedDatabaseContext"));
  unsigned int v75 = [v74 startAccessingReturningError:0];
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  id v79 = v3;
  id obj = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3, "allKeys"));
  id v16 = [obj countByEnumeratingWithState:&v111 objects:v127 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v112;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v112 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v111 + 1) + 8LL * (void)j);
        uint64_t v21 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v20);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        id v23 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472LL;
        v102[2] = sub_10031220C;
        v102[3] = &unk_1003F3090;
        id v103 = v22;
        unsigned int v104 = v79;
        v105 = v20;
        char v106 = v80;
        uint64_t v107 = v83;
        v108 = v81;
        v109 = v15;
        id v110 = v82;
        id v25 = v22;
        [v24 modifyUsingTransaction:v102];
      }

      id v17 = [obj countByEnumeratingWithState:&v111 objects:v127 count:16];
    }

    while (v17);
  }

  if (v75) {
    [v74 stopAccessing];
  }
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v26 = v15;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v98,  v126,  16LL);
  if (v27)
  {
    id v29 = v27;
    uint64_t v30 = *(void *)v99;
    do
    {
      uint64_t v31 = 0LL;
      do
      {
        if (*(void *)v99 != v30) {
          objc_enumerationMutation(v26);
        }
        uint64_t v32 = *(void *)(*((void *)&v98 + 1) + 8LL * (void)v31);
        if (v32) {
          id Property = objc_getProperty(*(id *)(*((void *)&v98 + 1) + 8LL * (void)v31), v28, 104LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v34 = Property;
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", v34));

        if (!v35) {
          -[NSMutableArray addObject:](v81, "addObject:", v32);
        }
        uint64_t v31 = (char *)v31 + 1;
      }

      while (v29 != v31);
      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v98,  v126,  16LL);
      id v29 = v36;
    }

    while (v36);
  }

  -[NSMutableArray removeAllObjects](v26, "removeAllObjects");
  id v72 = v26;
  if (!-[NSMutableArray count](v81, "count"))
  {
    id v50 = objc_opt_new(&OBJC_CLASS___NSFileManager);
    id v57 = sub_100220D98((uint64_t)&OBJC_CLASS___Storage);
    id v89 = 0LL;
    char v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager contentsOfDirectoryAtPath:error:](v50, "contentsOfDirectoryAtPath:error:"));
    id v60 = v89;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id obja = v59;
    id v61 = [obja countByEnumeratingWithState:&v85 objects:v119 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v86;
      do
      {
        for (k = 0LL; k != v62; k = (char *)k + 1)
        {
          uint64_t v65 = v60;
          if (*(void *)v86 != v63) {
            objc_enumerationMutation(obja);
          }
          v66 = *(_TtC9appstored6LogKey **)(*((void *)&v85 + 1) + 8LL * (void)k);
          id v67 = (void *)objc_claimAutoreleasedReturnValue([v58 stringByAppendingPathComponent:v66]);
          id v84 = v60;
          unsigned __int8 v68 = -[NSFileManager removeItemAtPath:error:](v50, "removeItemAtPath:error:", v67, &v84);
          id v60 = v84;

          uint64_t v69 = ASDLogHandleForCategory(19LL);
          id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
          uint64_t v71 = v70;
          if ((v68 & 1) != 0 || !v60)
          {
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              NSErrorUserInfoKey v123 = v66;
              _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Successfully removed %{public}@ from the scratch directory",  buf,  0xCu);
            }
          }

          else if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            NSErrorUserInfoKey v123 = v66;
            __int16 v124 = 2114;
            id v125 = v60;
            _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "Failed to remove %{public}@ from the scratch directory: %{public}@",  buf,  0x16u);
          }
        }

        id v62 = [obja countByEnumeratingWithState:&v85 objects:v119 count:16];
      }

      while (v62);
    }

    goto LABEL_66;
  }

  uint64_t v37 = ASDLogHandleForCategory(19LL);
  __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = -[NSMutableArray count](v81, "count");
    *(_DWORD *)buf = 138543618;
    NSErrorUserInfoKey v123 = v80;
    __int16 v124 = 2048;
    id v125 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Found %lu download(s) to resume",  buf,  0x16u);
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v82, "allKeys"));
  id v41 = [v40 countByEnumeratingWithState:&v94 objects:v121 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v95;
    do
    {
      for (m = 0LL; m != v42; m = (char *)m + 1)
      {
        if (*(void *)v95 != v43) {
          objc_enumerationMutation(v40);
        }
        id v45 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)m);
        id v46 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
        uint64_t v47 = ASDLogHandleForCategory(19LL);
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          NSErrorUserInfoKey v123 = v46;
          __int16 v124 = 2114;
          id v125 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[%@]: Recreating promises for %{public}@",  buf,  0x16u);
        }

        __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v82, "objectForKeyedSubscript:", v45));
        sub_100311530(*(void *)(a1 + 32), v49, v45, v46);
      }

      id v42 = [v40 countByEnumeratingWithState:&v94 objects:v121 count:16];
    }

    while (v42);
  }

  __int128 v93 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v90 = 0u;
  id v50 = v81;
  id v51 = -[NSFileManager countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v90,  v120,  16LL);
  if (!v51)
  {
LABEL_66:
    id v55 = v72;
    id v54 = v73;
    goto LABEL_67;
  }

  id v52 = v51;
  uint64_t v53 = *(void *)v91;
  id v55 = v72;
  id v54 = v73;
  do
  {
    for (n = 0LL; n != v52; n = (char *)n + 1)
    {
      if (*(void *)v91 != v53) {
        objc_enumerationMutation(v50);
      }
      sub_10030F424(*(void **)(a1 + 32), *(void **)(*((void *)&v90 + 1) + 8LL * (void)n));
    }

    id v52 = -[NSFileManager countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v90,  v120,  16LL);
  }

  while (v52);
LABEL_67:
}

uint64_t sub_10031220C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100188344(v3, *(void **)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)]);
  id v44 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v44)
  {
    uint64_t v8 = *(void *)v47;
    uint64_t v43 = (id *)(a1 + 72);
    id v41 = (id *)(a1 + 80);
    *(void *)&__int128 v7 = 138543618LL;
    __int128 v40 = v7;
    uint64_t v42 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        if (sub_10018BD34(v10))
        {
          uint64_t v45 = 0LL;
          id v11 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
          id v12 = sub_10018BCC8(v10);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          uint64_t v14 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v11,  "initWithBundleIdentifier:allowPlaceholder:error:",  v13,  0LL,  &v45);

          if (!v14)
          {
            uint64_t v31 = ASDLogHandleForCategory(19LL);
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              id v37 = sub_10018BCC8(v10);
              __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              *(_DWORD *)buf = v40;
              id v51 = v38;
              __int16 v52 = 2114;
              uint64_t v53 = v45;
              _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Error retrieving application record for %{public}@: %{public}@",  buf,  0x16u);
            }

            goto LABEL_34;
          }

          if (sub_10018BD74(v10) != (id)1)
          {
            sub_1001C3F28((BOOL)v3, v10);
LABEL_34:

            continue;
          }
        }

        id v15 = sub_10018BCEC(v10);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        id v17 = sub_100187D90(v3, (uint64_t)v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

        if (v18) {
          BOOL v19 = v5 == 0LL;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          sub_10018C19C((uint64_t)&OBJC_CLASS___ODRAssetDownload, v10);
        }

        else
        {
          id v20 = sub_1002578E0( (uint64_t)&OBJC_CLASS___ODRAssetDownloadRequest,  v18,  v5,  *(void **)(a1 + 32),  *(void **)(a1 + 56));
          uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
          id v22 = (void *)v21;
          if (v21)
          {
            *(void *)(v21 + 232) = sub_10018BD74(v10);
            if (sub_10018BD74(v10) == (id)1)
            {
              id v23 = *(void **)(a1 + 64);
              id v24 = sub_10018BCC8(v10);
              id v25 = v6;
              __int128 v26 = v5;
              uint64_t v27 = a1;
              id v28 = v3;
              id v29 = (void *)objc_claimAutoreleasedReturnValue(v24);
              [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:v29];

              id v3 = v28;
              a1 = v27;
              id v5 = v26;
              id v6 = v25;
              uint64_t v8 = v42;
              uint64_t v30 = v43;
            }

            else
            {
              id v33 = sub_10018BD74(v10);
              uint64_t v30 = v43;
              if (v33 == (id)2) {
                uint64_t v30 = v41;
              }
            }

            objc_msgSend(*v30, "addObject:", v22, v40);
            id v34 = sub_10018BD10(v10);
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            if (v35 && sub_10018BD74(v10) == (id)1)
            {
              id v36 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 88) objectForKeyedSubscript:v35]);
              if (!v36) {
                id v36 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v36, "addObject:", v22);
              [*(id *)(a1 + 88) setObject:v36 forKeyedSubscript:v35];
            }
          }
        }
      }

      id v44 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }

    while (v44);
  }

  return 1LL;
}

void sub_1003125D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(dispatch_queue_s **)(a1 + 16);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = sub_1003126A0;
    void v11[3] = &unk_1003EA5C0;
    id v12 = v7;
    id v13 = v8;
    uint64_t v14 = a1;
    id v15 = v9;
    dispatch_async(v10, v11);
  }
}

void sub_1003126A0(void **a1)
{
  id v1 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, a1[4]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v4 = ASDLogHandleForCategory(19LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a1[4];
    id v7 = (uint64_t (*)(uint64_t, uint64_t))a1[5];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    __int128 v97 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%@]: Checking for prefetch downloads for %{public}@ - %{public}@",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  __int128 v97 = sub_100310498;
  __int128 v98 = sub_1003104A8;
  __int128 v99 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v82 = 0LL;
  id v83 = &v82;
  uint64_t v84 = 0x2020000000LL;
  uint64_t v85 = 0LL;
  id v8 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_100312F48;
  v76[3] = &unk_1003F30B8;
  id v77 = a1[5];
  id v51 = v2;
  id v78 = v51;
  newValue = v3;
  id v79 = newValue;
  id v80 = &v82;
  uint64_t v81 = buf;
  [v9 readUsingSession:v76];

  id v10 = sub_10028715C((uint64_t)&OBJC_CLASS___CellularMonitor);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v75 = 0LL;
  id v12 = sub_100287480(v11);
  __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v50 = (__CFString *)0LL;

  if (v52)
  {
    id v13 = sub_1001BB300((uint64_t)&OBJC_CLASS___ExpensiveNetworkEvaluator, v52);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = objc_opt_new(&OBJC_CLASS___EvaluatorDownload);
    id v17 = v15;
    if (v15)
    {
      v15->_automatic = 1;
      v15->_bytes = v83[3];
      objc_setProperty_atomic(v15, v16, newValue, 32LL);
    }

    unint64_t v18 = sub_1001BB3D8((uint64_t)v14, v17) & 0xFFFFFFFFFFFFFFFDLL;
    BOOL v19 = v18 == 1;
    uint64_t v20 = ASDLogHandleForCategory(19LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = @"Not allowing";
      id v23 = (void *)v83[3];
      if (v18 == 1) {
        id v22 = @"Allowing";
      }
      *(_DWORD *)__int128 v87 = 138412802;
      __int128 v88 = newValue;
      __int16 v89 = 2114;
      __int128 v90 = v22;
      __int16 v91 = 2048;
      __int128 v92 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ cellular for prefetch downloads with total size of %llu",  v87,  0x20u);
    }
  }

  else
  {
    uint64_t v24 = ASDLogHandleForCategory(19LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 v87 = 138412546;
      __int128 v88 = newValue;
      __int16 v89 = 2114;
      __int128 v90 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%@]: Not allowing cellular for prefetch downloads because no identity was found: %{public}@",  v87,  0x16u);
    }

    BOOL v19 = 0LL;
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v25 = *(id *)(*(void *)&buf[8] + 40LL);
  id v26 = [v25 countByEnumeratingWithState:&v71 objects:v95 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v72;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v72 != v27) {
          objc_enumerationMutation(v25);
        }
        sub_100258544(*(id **)(*((void *)&v71 + 1) + 8LL * (void)i), v19);
      }

      id v26 = [v25 countByEnumeratingWithState:&v71 objects:v95 count:16];
    }

    while (v26);
  }

  uint64_t v29 = ASDLogHandleForCategory(19LL);
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = (const __CFString *)[*(id *)(*(void *)&buf[8] + 40) count];
    id v32 = sub_1002D9D08((uint64_t)v51);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v34 = a1[5];
    *(_DWORD *)__int128 v87 = 138413058;
    __int128 v88 = newValue;
    __int16 v89 = 2048;
    __int128 v90 = v31;
    __int16 v91 = 2114;
    __int128 v92 = v33;
    __int16 v93 = 2114;
    __int128 v94 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[%@]: Starting %lu prefetch downloads for %{public}@ - %{public}@",  v87,  0x2Au);
  }

  __int128 v35 = dispatch_group_create();
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id obj = *(id *)(*(void *)&buf[8] + 40LL);
  id v36 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v68;
    do
    {
      __int128 v38 = 0LL;
      do
      {
        if (*(void *)v68 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)v38);
        dispatch_group_enter(v35);
        if (v39) {
          *(_BYTE *)(v39 + 80) = 1;
        }
        uint64_t v40 = ASDLogHandleForCategory(19LL);
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          if (v39)
          {
            uint64_t v43 = (_TtC9appstored6LogKey *)objc_getProperty((id)v39, v42, 184LL, 1);
            id v44 = *(const __CFString **)(v39 + 176);
          }

          else
          {
            uint64_t v43 = 0LL;
            id v44 = 0LL;
          }

          *(_DWORD *)__int128 v87 = 138412546;
          __int128 v88 = v43;
          __int16 v89 = 2048;
          __int128 v90 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "[%@]: Starting prefetch download with priority %f",  v87,  0x16u);
        }

        objc_initWeak((id *)v87, (id)v39);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472LL;
        v64[2] = sub_100313104;
        v64[3] = &unk_1003F30E0;
        objc_copyWeak(&v66, (id *)v87);
        uint64_t v45 = v35;
        uint64_t v65 = v45;
        if (v39)
        {
          [*(id *)(v39 + 256) addErrorBlock:v64];
          char v58 = _NSConcreteStackBlock;
          uint64_t v59 = 3221225472LL;
          id v60 = sub_100313214;
          id v61 = &unk_1003F3108;
          objc_copyWeak(&v63, (id *)v87);
          id v62 = v45;
          [*(id *)(v39 + 256) addSuccessBlock:&v58];
        }

        else
        {
          char v58 = _NSConcreteStackBlock;
          uint64_t v59 = 3221225472LL;
          id v60 = sub_100313214;
          id v61 = &unk_1003F3108;
          objc_copyWeak(&v63, (id *)v87);
          id v62 = v45;
        }

        sub_10030F424(a1[6], (void *)v39);

        objc_destroyWeak(&v63);
        objc_destroyWeak(&v66);
        objc_destroyWeak((id *)v87);
        __int128 v38 = (char *)v38 + 1;
      }

      while (v36 != v38);
      id v46 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
      id v36 = v46;
    }

    while (v46);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  __int128 v48 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100313300;
  block[3] = &unk_1003E9D48;
  id v49 = a1[7];
  void block[4] = a1[6];
  id v57 = v49;
  dispatch_group_notify(v35, v48, block);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(buf, 8);
}

void sub_100312EB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_100312F48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100187A78(v3, *(void *)(a1 + 32), 2LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ([v5 count])
  {
    id v6 = sub_100188344(v3, *(void **)(a1 + 40));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v20 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = sub_10018BCEC(*(void **)(*((void *)&v21 + 1) + 8LL * (void)i));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          id v15 = sub_100187D90(v3, (uint64_t)v14);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          id v17 = sub_1002578E0( (uint64_t)&OBJC_CLASS___ODRAssetDownloadRequest,  v16,  v7,  *(void **)(a1 + 40),  *(void **)(a1 + 48));
          uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
          BOOL v19 = (void *)v18;
          if (v18)
          {
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += *(void *)(v18 + 144);
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v18];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v10);
    }

    id v5 = v20;
  }
}

void sub_100313104(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = ASDLogHandleForCategory(19LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v7, 184LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = Property;
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[%@]: Failed prefetch download with error: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100313214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = ASDLogHandleForCategory(19LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v5, 184LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v7 = Property;
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@]: Successfully finished prefetch download",  (uint8_t *)&v8,  0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100313300(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100313378;
    block[3] = &unk_1003EA158;
    id v4 = v1;
    dispatch_async(v2, block);
  }

uint64_t sub_100313378(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100313384(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_10031340C;
    v6[3] = &unk_1003E9DC0;
    id v7 = v3;
    uint64_t v8 = a1;
    dispatch_async(v5, v6);
  }
}

void sub_10031340C(uint64_t a1)
{
  uint64_t v1 = ASDLogHandleForCategory(19LL);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 64LL, 1);
    }
    id v6 = Property;
    id v7 = *(id *)(a1 + 32);
    if (v7) {
      id v7 = objc_getProperty(v7, v5, 24LL, 1);
    }
    id v9 = v7;
    id v10 = *(id *)(a1 + 32);
    if (v10) {
      id v10 = objc_getProperty(v10, v8, 40LL, 1);
    }
    id v11 = (uint64_t (*)(uint64_t, uint64_t))v10;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    __int16 v91 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[%@]: Checking for initial downloads for %{public}@ - %{public}@",  buf,  0x20u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    int v13 = *(_BYTE *)(v12 + 16) & 1;
  }
  else {
    int v13 = 0;
  }
  uint64_t v14 = ASDLogHandleForCategory(19LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      id v18 = *(id *)(a1 + 32);
      if (v18) {
        id v18 = objc_getProperty(v18, v17, 64LL, 1);
      }
      id v19 = v18;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@]: Skipping manifest fetch for App Review install",  buf,  0xCu);
    }
  }

  else
  {
    if (v16)
    {
      id v20 = *(id *)(a1 + 32);
      if (v20) {
        id v20 = objc_getProperty(v20, v17, 64LL, 1);
      }
      id v21 = v20;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@]: Fetching manifest", buf, 0xCu);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    id v15 = (os_log_s *)*(id *)(a1 + 32);
    if (v22)
    {
      id v23 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_100315D80;
      __int16 v91 = (uint64_t (*)(uint64_t, uint64_t))&unk_1003E9880;
      __int128 v92 = v15;
      sub_1001CAA38((uint64_t)v24, buf);
    }
  }

  uint64_t v25 = *(void *)(a1 + 40);
  id v26 = (void **)*(id *)(a1 + 32);
  if (!v25)
  {
    uint64_t v43 = 0LL;
    goto LABEL_36;
  }

  uint64_t v77 = 0LL;
  id v78 = &v77;
  uint64_t v79 = 0x3032000000LL;
  id v80 = sub_100310498;
  uint64_t v81 = sub_1003104A8;
  uint64_t v82 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v27 = sub_1001FEF90(v26);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (v26) {
    uint64_t v29 = (void **)v26[9];
  }
  else {
    uint64_t v29 = 0LL;
  }
  id v30 = v28;
  uint64_t v31 = 0LL;
  id v83 = 0LL;
  uint64_t v84 = (uint64_t)&v83;
  uint64_t v85 = 0x3032000000LL;
  __int128 v86 = sub_100310498;
  __int128 v87 = sub_1003104A8;
  __int128 v88 = 0LL;
  if ((unint64_t)v29 <= 2)
  {
    id v32 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = sub_100316618;
    __int16 v91 = (uint64_t (*)(uint64_t, uint64_t))&unk_1003F31A8;
    __int16 v93 = &v83;
    __int128 v94 = v29;
    __int128 v92 = (void (*)(uint64_t))v30;
    [v33 readUsingSession:buf];

    uint64_t v31 = *(void **)(v84 + 40);
  }

  id v34 = v31;
  _Block_object_dispose(&v83, 8);

  if (!v26)
  {
    id v71 = v30;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    __int16 v91 = sub_100310498;
    __int128 v92 = sub_1003104A8;
    __int16 v93 = 0LL;
    goto LABEL_30;
  }

  unint64_t v35 = (unint64_t)v26[9];
  id v36 = v30;
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  __int16 v91 = sub_100310498;
  __int128 v92 = sub_1003104A8;
  __int16 v93 = 0LL;
  if ((v35 | 2) == 2)
  {
LABEL_30:
    id v37 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v83 = _NSConcreteStackBlock;
    uint64_t v84 = 3221225472LL;
    uint64_t v85 = (uint64_t)sub_100316674;
    __int128 v86 = (uint64_t (*)(uint64_t, uint64_t))&unk_1003EB858;
    __int128 v88 = buf;
    __int128 v87 = (void (*)(uint64_t))v30;
    [v38 readUsingSession:&v83];

    uint64_t v39 = *(void **)(*(void *)&buf[8] + 40LL);
    goto LABEL_32;
  }

  uint64_t v39 = 0LL;
LABEL_32:
  id v40 = v39;
  _Block_object_dispose(buf, 8);

  if ([v34 count] || objc_msgSend(v40, "count"))
  {
    id v41 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = sub_1003159D0;
    __int16 v91 = (uint64_t (*)(uint64_t, uint64_t))&unk_1003F3158;
    __int128 v92 = (void (*)(uint64_t))v30;
    __int16 v93 = (void ***)v34;
    __int128 v94 = v26;
    __int128 v96 = &v77;
    id v95 = v40;
    [v42 modifyUsingTransaction:buf];
  }

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v78[5]));

  _Block_object_dispose(&v77, 8);
LABEL_36:

  uint64_t v44 = ASDLogHandleForCategory(19LL);
  uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    id v47 = *(id *)(a1 + 32);
    if (v47) {
      id v47 = objc_getProperty(v47, v46, 64LL, 1);
    }
    id v48 = v47;
    id v49 = [v43 count];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v48;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v49;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[%@]: Found %ld initial download(s)",  buf,  0x16u);
  }

  id v51 = *(id *)(a1 + 32);
  uint64_t v52 = *(void *)(a1 + 40);
  if (v51) {
    id v51 = objc_getProperty(v51, v50, 40LL, 1);
  }
  id v54 = v51;
  id v55 = *(id *)(a1 + 32);
  if (v55) {
    id v55 = objc_getProperty(v55, v53, 64LL, 1);
  }
  id v56 = v55;
  sub_100311530(v52, v43, v54, v56);

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v57 = v43;
  id v58 = [v57 countByEnumeratingWithState:&v73 objects:v89 count:16];
  if (v58)
  {
    uint64_t v59 = *(void *)v74;
    do
    {
      id v60 = 0LL;
      do
      {
        if (*(void *)v74 != v59) {
          objc_enumerationMutation(v57);
        }
        uint64_t v61 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v60);
        uint64_t v62 = ASDLogHandleForCategory(19LL);
        id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          id v65 = *(id *)(a1 + 32);
          if (v65) {
            id v65 = objc_getProperty(v65, v64, 64LL, 1);
          }
          id v67 = v65;
          if (v61) {
            id v68 = objc_getProperty(v61, v66, 184LL, 1);
          }
          else {
            id v68 = 0LL;
          }
          id v69 = v68;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v67;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v69;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "[%@]: Requesting download %{public}@",  buf,  0x16u);
        }

        sub_10030F424(*(void **)(a1 + 40), v61);
        id v60 = (char *)v60 + 1;
      }

      while (v58 != v60);
      id v70 = [v57 countByEnumeratingWithState:&v73 objects:v89 count:16];
      id v58 = v70;
    }

    while (v70);
  }
}

void sub_100313BF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

NSMutableArray *sub_100313C3C(uint64_t a1)
{
  if (!a1) {
    return (NSMutableArray *)0LL;
  }
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100462820);
  if (qword_100462828)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100462828, "objectEnumerator", 0));
    id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          -[NSMutableArray addObject:](v1, "addObject:", *(void *)(*((void *)&v8 + 1) + 8LL * (void)i));
        }

        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v4);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100462820);
  return v1;
}

id sub_100313D6C(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v2 = a2;
    id v3 = sub_1001F794C(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = sub_1001F7970(v2);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v4,  v6));
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100462820);
    if (v7) {
      BOOL v8 = qword_100462828 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      __int128 v9 = 0LL;
    }
    else {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100462828 objectForKey:v7]);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100462820);
  }

  else
  {
    __int128 v9 = 0LL;
  }

  return v9;
}

BOOL sub_100313E48(BOOL a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v10 = 0LL;
    __int128 v11 = &v10;
    uint64_t v12 = 0x2020000000LL;
    char v13 = 0;
    id v4 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100314C50;
    void v7[3] = &unk_1003EC4F8;
    id v8 = v3;
    __int128 v9 = &v10;
    sub_1001CAA38((uint64_t)v5, v7);

    a1 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void sub_100313F1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100313F34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v6;
  if (a1)
  {
    if (v6)
    {
      sub_1003107A0(a1, v5);
      sub_100258268((uint64_t)v5, v8);
    }

    else
    {
      if (v5)
      {
        id v9 = objc_getProperty(v5, v7, 200LL, 1);
        id Property = objc_getProperty(v5, v10, 200LL, 1);
      }

      else
      {
        id v9 = 0LL;
        id Property = 0LL;
      }

      id v12 = Property;
      objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount"));

      char v13 = v5;
      v48[0] = 0LL;
      v48[1] = v48;
      v48[2] = 0x2020000000LL;
      char v49 = 1;
      id v14 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_1003162B0;
      id v51 = &unk_1003EC4F8;
      BOOL v16 = v13;
      uint64_t v52 = v16;
      uint64_t v53 = v48;
      sub_1001CAA38((uint64_t)v15, buf);

      _Block_object_dispose(v48, 8);
      sub_1002583B0((uint64_t)v16);
      id v17 = sub_10021E048((uint64_t)&OBJC_CLASS___CacheDeleteCoordinator);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = v18;
      if (v18) {
        sub_10021F55C(v18, 1, 0, 10.0);
      }
    }

    id v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (v5) {
      id v22 = objc_getProperty(v5, v20, 104LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    id v23 = v22;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, @"bundleID");

    if (v5) {
      uint64_t v24 = v5[29];
    }
    else {
      uint64_t v24 = 0LL;
    }
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v24));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v25, @"odrType");

    if (v5) {
      uint64_t v26 = v5[18];
    }
    else {
      uint64_t v26 = 0LL;
    }
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v26));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v27, @"downloadSize");

    if (v5) {
      BOOL v28 = (*((_BYTE *)v5 + 84) & 1) == 0;
    }
    else {
      BOOL v28 = 1LL;
    }
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v28));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, @"isFileBased");

    if (v5) {
      uint64_t v30 = *((_BYTE *)v5 + 83) & 1;
    }
    else {
      uint64_t v30 = 0LL;
    }
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v31, @"isStoreBased");

    if (v8)
    {
      id v32 = sub_100298CBC(v8);
      id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v33, @"error");

      id v34 = &__kCFBooleanFalse;
    }

    else
    {
      id v34 = &__kCFBooleanTrue;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v34, @"result");
    sub_10030F080((uint64_t)&OBJC_CLASS___Analytics, v21, 20LL);
    uint64_t v35 = ASDLogHandleForCategory(19LL);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
      {
        id v43 = objc_getProperty(v5, v37, 184LL, 1);
        id v45 = objc_getProperty(v5, v44, 200LL, 1);
        id v46 = v43;
      }

      else
      {
        id v43 = 0LL;
        id v46 = 0LL;
        id v45 = 0LL;
      }

      id v47 = v45;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v47;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "[%@] Download made progress: %{public}@",  buf,  0x16u);
    }

    __int128 v38 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100462820);
    id v40 = (void *)qword_100462828;
    if (qword_100462828)
    {
      if (v5) {
        id v41 = objc_getProperty(v38, v39, 240LL, 1);
      }
      else {
        id v41 = 0LL;
      }
      id v42 = v41;
      [v40 removeObjectForKey:v42];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100462820);
    sub_10018C248((uint64_t)&OBJC_CLASS___ODRAssetDownload, v38);
  }
}

void sub_1003143F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100314418(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  sub_100313F34((uint64_t)WeakRetained, *(void **)(a1 + 32), v4);
}

BOOL sub_100314470(uint64_t a1, void *a2)
{
  return sub_1001C5930(a2, *(void **)(a1 + 32));
}

void sub_100314480(void *a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_1002586C4(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSFileManager);
    *(void *)&__int128 v86 = 0LL;
    *((void *)&v86 + 1) = &v86;
    uint64_t v87 = 0x3032000000LL;
    __int128 v88 = sub_100310498;
    __int16 v89 = sub_1003104A8;
    id v90 = 0LL;
    id obj = 0LL;
    unsigned int v6 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v5,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v4,  1LL,  0LL,  &obj);
    objc_storeStrong(&v90, obj);
    if (!v6)
    {
      uint64_t v27 = ASDLogHandleForCategory(19LL);
      BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if (v2) {
          id Property = objc_getProperty(v2, v29, 184LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v31 = Property;
        uint64_t v32 = *(void *)(*((void *)&v86 + 1) + 40LL);
        *(_DWORD *)buf = 138412546;
        uint64_t v81 = (uint64_t)v31;
        __int16 v82 = 2114;
        uint64_t v83 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%@] Error creating path for download: %{public}@",  buf,  0x16u);
      }

      sub_100313F34((uint64_t)a1, v2, *(void **)(*((void *)&v86 + 1) + 40LL));
      goto LABEL_49;
    }

    uint64_t v7 = ASDLogHandleForCategory(19LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v2)
      {
        id v10 = objc_getProperty(v2, v9, 184LL, 1);
        uint64_t v11 = v2[18];
        uint64_t v12 = v2[19];
        uint64_t v13 = (uint64_t)v10;
      }

      else
      {
        uint64_t v11 = 0LL;
        id v10 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v12 = 0LL;
      }

      *(_DWORD *)buf = 138412802;
      uint64_t v81 = v13;
      __int16 v82 = 2048;
      uint64_t v83 = v11;
      __int16 v84 = 2048;
      uint64_t v85 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Starting ODR Download with download size: %lu and expected disk usage: %lld",  buf,  0x20u);
    }

    id v14 = sub_100258968((uint64_t)v2);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = v2;
    uint64_t v17 = MGGetProductType();
    if (v17 == 1110205732 || v17 == 33245053)
    {
      id v18 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = [v19 interfaceType];

      if (v20 == (id)3)
      {
        id v22 = 0LL;
      }

      else
      {
        if (v16) {
          id v34 = objc_getProperty(v16, v21, 216LL, 1);
        }
        else {
          id v34 = 0LL;
        }
        id v35 = v34;
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 host]);

        if (v20 == (id)1 && ([v36 isEqualToString:@"localhost"] & 1) == 0)
        {
          objc_opt_self(&OBJC_CLASS___ODRPlatformPolicies);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 89128960LL));
        }

        else
        {
          id v22 = 0LL;
        }
      }

      BOOL v33 = v20 == (id)3;
    }

    else
    {
      BOOL v33 = 0;
      id v22 = 0LL;
    }

    uint64_t v37 = ASDLogHandleForCategory(19LL);
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      id v63 = [v22 unsignedLongLongValue];
      *(_DWORD *)buf = 134218240;
      uint64_t v81 = 8LL * (void)v63;
      __int16 v82 = 1024;
      LODWORD(v83) = v33;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Rate Limit : %{bitrate}llu (Ethernet : %{BOOL}d)",  buf,  0x12u);
    }

    if (v15) {
      objc_setProperty_atomic(v15, v39, v22, 40LL);
    }

    id v40 = sub_100258710((uint64_t)v16);
    id v65 = (void *)objc_claimAutoreleasedReturnValue(v40);
    id v41 = sub_1001E75A8((id *)objc_alloc(&OBJC_CLASS___ODRZipStreamDataConsumer), v65);
    id v43 = v41;
    if (v41) {
      objc_storeWeak(v41 + 5, v16);
    }
    if (v15) {
      objc_setProperty_atomic(v15, v42, v43, 64LL);
    }
    if (v16)
    {
      uint64_t v44 = 5LL;
      if ((v16[83] & 1) == 0) {
        uint64_t v44 = 6LL;
      }
      if (!v15) {
        goto LABEL_40;
      }
    }

    else
    {
      uint64_t v44 = 6LL;
      if (!v15) {
        goto LABEL_40;
      }
    }

    v15[3] = v44;
LABEL_40:
    id v46 = objc_alloc(&OBJC_CLASS___AssetRequest);
    if (v16) {
      id v47 = objc_getProperty(v16, v45, 216LL, 1);
    }
    else {
      id v47 = 0LL;
    }
    id v48 = v47;
    uint64_t v64 = sub_10027399C(v46, (uint64_t)v48, v15);

    id v49 = sub_1002B9840((uint64_t)&OBJC_CLASS___AssetSession);
    id v50 = (_TtC9appstored12AssetPromise *)objc_claimAutoreleasedReturnValue(v49);
    id v51 = sub_1002B9EF0(v50, v64);
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

    if (v16)
    {
      objc_setProperty_atomic(v16, v53, v52, 96LL);
      id v55 = objc_getProperty(v16, v54, 208LL, 1);
    }

    else
    {
      id v55 = 0LL;
    }

    id v56 = v55;
    BOOL v57 = v56 == 0LL;

    if (v57)
    {
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      if (v16) {
        objc_setProperty_atomic(v16, v58, v59, 208LL);
      }
    }

    objc_initWeak((id *)buf, a1);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_100314D3C;
    v74[3] = &unk_1003F30E0;
    objc_copyWeak(&v76, (id *)buf);
    id v60 = v16;
    id v75 = v60;
    [v52 addErrorBlock:v74];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_10031541C;
    v67[3] = &unk_1003F3130;
    objc_copyWeak(&v73, (id *)buf);
    id v68 = v60;
    id v69 = a1;
    id v70 = v4;
    __int128 v72 = &v86;
    id v71 = v5;
    [v52 addSuccessBlock:v67];

    objc_destroyWeak(&v73);
    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);

LABEL_49:
    _Block_object_dispose(&v86, 8);

    goto LABEL_50;
  }

  uint64_t v23 = ASDLogHandleForCategory(19LL);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    if (v2) {
      id v61 = objc_getProperty(v2, v25, 184LL, 1);
    }
    else {
      id v61 = 0LL;
    }
    id v62 = v61;
    LODWORD(v86) = 138412290;
    *(void *)((char *)&v86 + 4) = v62;
    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[%@] Nil destination path for asset",  (uint8_t *)&v86,  0xCu);
  }

  NSErrorUserInfoKey v78 = NSLocalizedRecoverySuggestionErrorKey;
  uint64_t v79 = @"Attempted to download asset pack into nil destination.";
  id v5 = (NSFileManager *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4LL,  v5));
  sub_100313F34((uint64_t)a1, v2, v26);

LABEL_50:
}

void sub_100314BE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, id location)
{
}

void sub_100314C50(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 136LL, 1);
  }
  id v4 = Property;

  if (v4)
  {
    id v6 = *(id *)(a1 + 32);
    if (v6) {
      id v6 = objc_getProperty(v6, v5, 136LL, 1);
    }
    id v7 = v6;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 1LL));

    id v9 = *(id *)(a1 + 32);
    if (v9) {
      id v9 = objc_getProperty(v9, v8, 120LL, 1);
    }
    id v10 = v9;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = sub_1001ACAFC( (uint64_t)&OBJC_CLASS___ODRAssetPack,  v11,  v10);
  }

void sub_100314D3C(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  sub_100314D94((uint64_t)WeakRetained, v4, *(void **)(a1 + 32));
}

void sub_100314D94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t v7 = ASDLogHandleForCategory(19LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    if (v6) {
      id Property = objc_getProperty(v6, v9, 184LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v22 = Property;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@] Error downloading asset: %{public}@",  buf,  0x16u);
  }

  if (!v6) {
    goto LABEL_7;
  }
  id v11 = objc_getProperty(v6, v10, 208LL, 1);
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v13 = v11;
  id v14 = objc_getProperty(v6, v12, 208LL, 1);
  if (v14)
  {
    id v15 = v14;
    [v14 timeIntervalSinceNow];
    BOOL v17 = v16 < -604800.0;

    if (v17)
    {
LABEL_7:
      uint64_t v18 = ASDLogHandleForCategory(19LL);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (v6) {
          id v23 = objc_getProperty(v6, v20, 184LL, 1);
        }
        else {
          id v23 = 0LL;
        }
        id v24 = v23;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "[%@] Failing download, exceeded maximum retry time",  buf,  0xCu);
      }

      sub_100313F34(a1, v6, v5);
      goto LABEL_9;
    }
  }

  else
  {
  }

  if (!ASDErrorIsEqual(v5, @"AssetErrorDomain", 6LL) || (v6[81] & 1) != 0)
  {
    if (ASDErrorIsEqual(v5, NSURLErrorDomain, -1001LL))
    {
      uint64_t v33 = ASDLogHandleForCategory(19LL);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = objc_getProperty(v6, v35, 184LL, 1);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[%@] Restarting download after previous attempt timed out",  buf,  0xCu);
      }

      sub_100314480(a1, v6);
    }

    else
    {
      sub_100313F34(a1, v6, v5);
    }
  }

  else
  {
    uint64_t v25 = v6;
    id v60 = v5;
    uint64_t v26 = ASDLogHandleForCategory(19LL);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v58 = objc_getProperty(v25, v28, 184LL, 1);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v58;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%@] Handling manifest refresh for expired URL",  buf,  0xCu);
    }

    BOOL v29 = v25[29] == 1LL;
    id v31 = objc_getProperty(v25, v30, 104LL, 1);
    if (v29) {
      uint64_t v32 = sub_1002D9790((uint64_t)&OBJC_CLASS___ODRApplication, v31);
    }
    else {
      uint64_t v32 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v31);
    }
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v32);

    id v39 = objc_getProperty(v25, v38, 112LL, 1);
    id v40 = sub_1001F8C7C((uint64_t)&OBJC_CLASS___ODRClient, v39, v37);
    id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    if (v41)
    {
      uint64_t v42 = ASDLogHandleForCategory(19LL);
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        id v59 = objc_getProperty(v25, v44, 184LL, 1);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v41;
        _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "[%@] Refresh failed with error: %{public}@",  buf,  0x16u);
      }

      sub_100313F34(a1, v25, v41);
    }

    else
    {
      *(void *)buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      id v66 = sub_100310498;
      id v67 = sub_1003104A8;
      id v68 = 0LL;
      id v45 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
      id v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_1003166B4;
      v62[3] = &unk_1003EB858;
      uint64_t v64 = buf;
      id v47 = v25;
      id v63 = v47;
      [v46 readUsingSession:v62];

      id v49 = objc_getProperty(v47, v48, 216LL, 1);
      id v50 = sub_1001F7CB0(*(void **)(*(void *)&buf[8] + 40LL));
      id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      unsigned int v52 = [v49 isEqual:v51];

      if (v52)
      {
        uint64_t v53 = ASDLogHandleForCategory(19LL);
        SEL v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v61 = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "Failed to get a new URL after a manifest refresh, failing",  v61,  2u);
        }

        sub_100313F34(a1, v47, v60);
      }

      else
      {
        id v55 = sub_1001F7CB0(*(void **)(*(void *)&buf[8] + 40LL));
        id v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        objc_setProperty_atomic_copy(v47, v57, v56, 216LL);

        v6[81] = 1;
        sub_10018C390((uint64_t)&OBJC_CLASS___ODRAssetDownload, v47);
        sub_100314480(a1, v47);
      }

      _Block_object_dispose(buf, 8);
    }
  }

void sub_1003153F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10031541C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (v3) {
    id Property = objc_getProperty(v3, v4, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;

  if (v7)
  {
    if (v3) {
      id v9 = objc_getProperty(v3, v8, 32LL, 1);
    }
    else {
      id v9 = 0LL;
    }
    id v10 = v9;
    sub_100314D94((uint64_t)WeakRetained, v10, *(void **)(a1 + 32));

    goto LABEL_50;
  }

  uint64_t v11 = ASDLogHandleForCategory(19LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = *(id *)(a1 + 32);
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 184LL, 1);
    }
    id v15 = v14;
    *(_DWORD *)buf = 138412290;
    id v79 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Successfully downloaded asset", buf, 0xCu);
  }

  id v17 = *(id *)(a1 + 32);
  if (v17) {
    id v17 = objc_getProperty(v17, v16, 136LL, 1);
  }
  id v18 = v17;

  if (v18)
  {
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = *(void **)(a1 + 48);
    id v22 = *(id *)(a1 + 32);
    if (v22) {
      id v22 = objc_getProperty(v22, v19, 136LL, 1);
    }
    id v23 = v22;
    id v24 = v23;
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8LL);
    BOOL v28 = *(void **)(v25 + 40);
    uint64_t v27 = (id *)(v25 + 40);
    uint64_t v26 = v28;
    id obj = v28;
    if (v20)
    {
      id v29 = v23;
      id v30 = v21;
      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int v32 = [v31 moveItemAtPath:v30 toPath:v29 error:&obj];

      objc_storeStrong(v27, obj);
      if (v32)
      {
        uint64_t v33 = ASDLogHandleForCategory(19LL);
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = *(id *)(a1 + 32);
          if (v36) {
            id v36 = objc_getProperty(v36, v35, 184LL, 1);
          }
          id v37 = v36;
          *(_DWORD *)buf = 138412290;
          id v79 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[%@] Successfully moved the asset into its destination path",  buf,  0xCu);
        }

LABEL_23:
        SEL v38 = *(void **)(a1 + 32);
        uint64_t v39 = (uint64_t)WeakRetained;
        id v40 = 0LL;
LABEL_49:
        sub_100313F34(v39, v38, v40);
        goto LABEL_50;
      }
    }

    else
    {
      objc_storeStrong(v27, v26);
    }

    unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) domain]);
    if ([v52 isEqualToString:NSCocoaErrorDomain])
    {
      id v53 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) code];

      if (v53 == (id)516)
      {
        uint64_t v54 = ASDLogHandleForCategory(19LL);
        id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          id v57 = *(id *)(a1 + 32);
          if (v57) {
            id v57 = objc_getProperty(v57, v56, 184LL, 1);
          }
          id v58 = v57;
          *(_DWORD *)buf = 138412290;
          id v79 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "[%@] Asset already exists at the destination path, validating",  buf,  0xCu);
        }

        uint64_t v61 = *(void *)(a1 + 48);
        id v60 = *(void **)(a1 + 56);
        id v62 = *(id *)(a1 + 32);
        if (v62) {
          id v62 = objc_getProperty(v62, v59, 136LL, 1);
        }
        id v63 = v62;
        uint64_t v64 = *(void *)(*(void *)(a1 + 64) + 8LL);
        id v76 = *(id *)(v64 + 40);
        unsigned int v65 = [v60 moveItemAtPath:v61 toPath:v63 error:&v76];
        objc_storeStrong((id *)(v64 + 40), v76);

        if (v65) {
          goto LABEL_23;
        }
        uint64_t v66 = ASDLogHandleForCategory(19LL);
        id v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          id v69 = *(id *)(a1 + 32);
          if (v69) {
            id v69 = objc_getProperty(v69, v68, 184LL, 1);
          }
          id v70 = v69;
          uint64_t v71 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          *(_DWORD *)buf = 138412546;
          id v79 = v70;
          __int16 v80 = 2114;
          uint64_t v81 = v71;
LABEL_54:
          _os_log_error_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "[%@] Failed to move the downloaded asset into place: %{public}@",  buf,  0x16u);

          goto LABEL_48;
        }

        goto LABEL_48;
      }
    }

    else
    {
    }

    uint64_t v72 = ASDLogHandleForCategory(19LL);
    id v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      id v74 = *(id *)(a1 + 32);
      if (v74) {
        id v74 = objc_getProperty(v74, v73, 184LL, 1);
      }
      id v70 = v74;
      uint64_t v75 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412546;
      id v79 = v70;
      __int16 v80 = 2114;
      uint64_t v81 = v75;
      goto LABEL_54;
    }

uint64_t sub_1003159D0(uint64_t a1, void *a2)
{
  id v42 = a2;
  id v3 = sub_100188344(v42, *(void **)(a1 + 32));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = *(id *)(a1 + 40);
  id v5 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v48;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v9);
        uint64_t v11 = *(void **)(a1 + 32);
        id Property = *(id *)(a1 + 48);
        if (Property) {
          id Property = objc_getProperty(Property, v6, 64LL, 1);
        }
        id v13 = Property;
        id v14 = sub_1002578E0((uint64_t)&OBJC_CLASS___ODRAssetDownloadRequest, v10, v4, v11, v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          id v17 = *(id *)(a1 + 48);
          if (v17) {
            id v17 = objc_getProperty(v17, v16, 40LL, 1);
          }
          id v18 = v17;
          objc_setProperty_atomic_copy(v15, v19, v18, 128LL);

          v15[29] = 1LL;
          id v21 = *(id *)(a1 + 48);
          if (v21) {
            id v21 = objc_getProperty(v21, v20, 80LL, 1);
          }
          id v22 = v21;
          objc_setProperty_atomic_copy(v15, v23, v22, 168LL);

          sub_1001C4E64((BOOL)v42, v15);
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v15];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }

    while (v7);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v24 = *(id *)(a1 + 56);
  id v25 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v25)
  {
    id v27 = v25;
    uint64_t v28 = *(void *)v44;
    do
    {
      id v29 = 0LL;
      do
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v24);
        }
        id v30 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v29);
        id v31 = *(void **)(a1 + 32);
        id v32 = *(id *)(a1 + 48);
        if (v32) {
          id v32 = objc_getProperty(v32, v26, 64LL, 1);
        }
        id v33 = v32;
        id v34 = sub_1002578E0((uint64_t)&OBJC_CLASS___ODRAssetDownloadRequest, v30, v4, v31, v33);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

        if (v35)
        {
          id v37 = *(id *)(a1 + 48);
          if (v37) {
            id v37 = objc_getProperty(v37, v36, 40LL, 1);
          }
          id v38 = v37;
          objc_setProperty_atomic_copy(v35, v39, v38, 128LL);

          v35[29] = 2LL;
          sub_1001C4E64((BOOL)v42, v35);
        }

        id v29 = (char *)v29 + 1;
      }

      while (v27 != v29);
      id v27 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }

    while (v27);
  }

  return 1LL;
}

void sub_100315CF0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  if (v3) {
    id Property = objc_getProperty(v3, v4, 104LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;
  id v7 = sub_100188F80(v5, v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 unsignedIntegerValue];
}

void sub_100315D80(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  id v3 = sub_1001FEF90(*(void ***)(a1 + 32));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001E6DFC(objc_alloc(&OBJC_CLASS___ODRManifestRequestTask), v4);
  v15[0] = 0LL;
  v15[1] = v15;
  void v15[2] = 0x3032000000LL;
  v15[3] = sub_100310498;
  v15[4] = sub_1003104A8;
  id v16 = 0LL;
  objc_initWeak(&location, v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  void v8[2] = sub_100315F28;
  v8[3] = &unk_1003F3180;
  objc_copyWeak(&v13, &location);
  id v6 = v4;
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  uint64_t v12 = v15;
  id v7 = v2;
  uint64_t v11 = v7;
  [v5 setCompletionBlock:v8];
  sub_1001E2DEC((uint64_t)&OBJC_CLASS___ODRTaskQueue, v5, -1LL);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(v15, 8);
}

void sub_100315EFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

void sub_100315F28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ((WeakRetained[24] & 1) != 0)
    {
      id v9 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1003160FC;
      v16[3] = &unk_1003F3068;
      id v17 = v4;
      id v18 = *(id *)(a1 + 32);
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 56);
      id v19 = v11;
      uint64_t v20 = v12;
      [v10 modifyUsingTransaction:v16];

      goto LABEL_7;
    }

    id Property = objc_getProperty(WeakRetained, v3, 32LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), Property);
  uint64_t v6 = ASDLogHandleForCategory(19LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v13 = *(id *)(a1 + 40);
    if (v13) {
      id v13 = objc_getProperty(v13, v8, 64LL, 1);
    }
    id v14 = v13;
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    *(_DWORD *)buf = 138412546;
    id v22 = v14;
    __int16 v23 = 2114;
    uint64_t v24 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[%@]: Failed updating manifest: %{public}@",  buf,  0x16u);
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

BOOL sub_1003160FC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 48LL, 1);
  }
  id v6 = Property;
  BOOL v7 = sub_1001C45C0(v4, v6, *(void **)(a1 + 40), 1);

  uint64_t v8 = ASDLogHandleForCategory(19LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(id *)(a1 + 48);
      if (v12) {
        id v12 = objc_getProperty(v12, v11, 64LL, 1);
      }
      id v13 = v12;
      int v19 = 138412290;
      id v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@]: Success updating manifest",  (uint8_t *)&v19,  0xCu);
    }

    sub_1001C54EC((BOOL)v4, *(void **)(a1 + 40));
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = *(id *)(a1 + 48);
      if (v16) {
        id v16 = objc_getProperty(v16, v14, 64LL, 1);
      }
      id v17 = v16;
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      int v19 = 138412546;
      id v20 = v17;
      __int16 v21 = 2114;
      uint64_t v22 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%@]: Failed updating manifest: %{public}@",  (uint8_t *)&v19,  0x16u);
    }
  }

  return v7;
}

void sub_1003162B0(uint64_t a1)
{
  id v2 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100316338;
  v6[3] = &unk_1003EB6B8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 modifyUsingTransaction:v6];
}

BOOL sub_100316338(uint64_t a1, void *a2)
{
  id v4 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 112LL, 1);
  }
  id v6 = Property;
  id v7 = sub_100187D90(v4, (uint64_t)v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    id v10 = *(id *)(a1 + 32);
    if (v10) {
      id v10 = objc_getProperty(v10, v9, 216LL, 1);
    }
    id v11 = v10;
    sub_1001F80CC(v8, v11);

    id v13 = *(id *)(a1 + 32);
    if (v13) {
      id v13 = objc_getProperty(v13, v12, 136LL, 1);
    }
    id v14 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v14, 1LL));

    sub_1001F7DBC(v8, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 setValue:v16 forProperty:@"last_used_date"];

    id v17 = sub_1001F7BA8(v8);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v19 = (uint64_t)v17;
      uint64_t v20 = *(unsigned __int8 *)(v18 + 82);
      if ((v20 & 1) == 0) {
        goto LABEL_18;
      }
      [*(id *)(v18 + 40) lock];
      uint64_t v21 = *(void *)(v18 + 48);
      [*(id *)(v18 + 40) unlock];
      else {
        v19 += v20 + v21;
      }
      sub_1001F7E10(v8, v19);
      uint64_t v22 = ASDLogHandleForCategory(19LL);
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = *(id *)(a1 + 32);
        if (v25) {
          id v25 = objc_getProperty(v25, v24, 184LL, 1);
        }
        id v26 = v25;
        int v34 = 138412546;
        id v35 = v26;
        __int16 v36 = 2048;
        uint64_t v37 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%@]: Updated pin count: %lld",  (uint8_t *)&v34,  0x16u);
      }

      uint64_t v18 = *(void *)(a1 + 32);
      if (v18) {
LABEL_18:
      }
        *(void *)(v18 + 192) = v19;
    }

    sub_1001F8070(v8, 0LL);
    sub_1001AD2D8(v8);
    BOOL v27 = sub_1001C5884(v4, v8);
  }

  else
  {
    uint64_t v28 = ASDLogHandleForCategory(19LL);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v32 = *(id *)(a1 + 32);
      if (v32) {
        id v32 = objc_getProperty(v32, v30, 184LL, 1);
      }
      id v33 = v32;
      int v34 = 138412290;
      id v35 = v33;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[%@]: Failed to find asset pack to update",  (uint8_t *)&v34,  0xCu);
    }

    BOOL v27 = 0LL;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return v27;
}

void sub_100316618(void *a1, id a2)
{
  uint64_t v3 = a1[4];
  if (a1[6] == 1LL) {
    id v4 = sub_100188AD0(a2, 4LL, v3);
  }
  else {
    id v4 = sub_1001884E0(a2, v3);
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100316674(uint64_t a1, id a2)
{
  id v3 = sub_100188608(a2, *(void *)(a1 + 32));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_1003166B4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  if (v3) {
    id Property = objc_getProperty(v3, v4, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v11 = Property;
  id v7 = sub_100187D90(v5, (uint64_t)v11);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void **sub_100316770(uint64_t a1)
{
  id v1 = sub_10022A0F0((uint64_t)&OBJC_CLASS___XPCServiceClient);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2) {
    id v3 = sub_1003167D0((void **)objc_alloc(&OBJC_CLASS___XPCRequestToken), v2, 0);
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void **sub_1003167D0(void **a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 processInfo]);
    }

    else
    {
      if (a3) {
        id v8 = sub_1001F4B54((uint64_t)&OBJC_CLASS___AMSProcessInfo);
      }
      else {
        id v8 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    }

    uint64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    a1 = sub_10031687C(a1, v6, v9, v10, 0LL);
  }

  return a1;
}

void **sub_10031687C(void **a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)&OBJC_CLASS___XPCRequestToken;
    a1 = (void **)objc_msgSendSuper2(&v26, "init");
    if (a1)
    {
      if (v12) {
        id v14 = v12;
      }
      else {
        id v14 = (id)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
      }
      uint64_t v15 = a1[6];
      a1[6] = v14;

      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v17 = a1[3];
      a1[3] = (void *)v16;

      uint64_t v18 = -[LogKey initWithBaseUUID:](objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey), "initWithBaseUUID:", a1[3]);
      uint64_t v19 = a1[4];
      a1[4] = v18;

      objc_storeStrong(a1 + 9, a3);
      objc_storeStrong(a1 + 7, a5);
      objc_storeStrong(a1 + 5, a2);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([a1[9] bundleIdentifier]);
      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.appstored.XPCRequestToken.%@.%@",  v20,  a1[4]));
      uint64_t v22 = a1[1];
      a1[1] = (void *)v21;

      sub_10027DA08((uint64_t)&OBJC_CLASS___TransactionStore, a1[1]);
      uint64_t v23 = voucher_copy();
      uint64_t v24 = a1[8];
      a1[8] = (void *)v23;
    }
  }

  return a1;
}

void **sub_100316A0C(uint64_t a1, int a2)
{
  return sub_1003167D0((void **)objc_alloc(&OBJC_CLASS____XPCInternalRequestToken), 0LL, a2);
}

void **sub_100316A44(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = objc_alloc(&OBJC_CLASS____XPCInternalRequestToken);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  uint64_t v6 = sub_10031687C((void **)&v4->super.super.isa, 0LL, v3, v5, 0LL);

  return v6;
}

void **sub_100316B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  id v5 = sub_100316770(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 processInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);

  if (v3)
  {
    uint64_t v9 =  -[AMSProcessInfo initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___AMSProcessInfo),  "initWithBundleIdentifier:",  v3);
    id v10 = v8;
    id v11 = v3;
    objc_opt_self(v4);
    id v12 = sub_10022A0F0((uint64_t)&OBJC_CLASS___XPCServiceClient);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v13) {
      id v14 = sub_10031687C((void **)objc_alloc(&OBJC_CLASS___XPCRequestToken), v13, v9, v10, v11);
    }
    else {
      id v14 = 0LL;
    }
  }

  else
  {
    id v14 = v6;
  }

  return v14;
}

id sub_100316C6C(id result, const char *a2)
{
  if (result) {
    return objc_getProperty(result, a2, 32LL, 1);
  }
  return result;
}

id sub_10031705C(uint64_t a1)
{
  if (qword_100462848 != -1) {
    dispatch_once(&qword_100462848, &stru_1003F31C8);
  }
  return (id)qword_100462840;
}

void sub_1003170A0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___AppInstallQueue);
  id v2 = (void *)qword_100462840;
  qword_100462840 = (uint64_t)v1;
}

void sub_1003171CC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = ASDLogHandleForCategory(2LL);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Validating active installations on daemon start",  buf,  2u);
    }

    uint64_t v4 = sub_1001E4F0C((uint64_t)&OBJC_CLASS___IXAppInstallCoordinator, 0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v15[0] = @"bundle_id";
    v15[1] = @"coordinator_id";
    void v15[2] = @"external_id";
    v15[3] = @"item_id";
    v15[4] = @"log_code";
    void v15[5] = @"policy";
    v15[6] = @"update_type";
    v15[7] = @"IFNULL(app_install.phase, 10)";
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 8LL));
    id v7 = *(void **)(a1 + 16);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    void v10[2] = sub_100317360;
    void v10[3] = &unk_1003ECE98;
    id v11 = v6;
    uint64_t v12 = a1;
    id v13 = v5;
    id v8 = v5;
    id v9 = v6;
    [v7 modifyUsingTransaction:v10];
  }

uint64_t sub_100317360(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"IFNULL(app_install.phase, 10)",  &off_10040D378,  6LL));
  v22[0] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(app_install.bootstrapped, 2)",  &off_10040D390));
  v22[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
  id v10 = sub_10024C1D0((uint64_t)&OBJC_CLASS___AppInstallEntity, v9, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100317530;
  v17[3] = &unk_1003F2838;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v18 = v3;
  uint64_t v19 = v12;
  id v20 = *(id *)(a1 + 48);
  id v21 = v4;
  id v14 = v4;
  id v15 = v3;
  [v11 enumeratePersistentIDsAndProperties:v13 usingBlock:v17];

  return 1LL;
}

void sub_100317530(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"policy"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v9 = (id *)sub_1002E6020(objc_alloc(&OBJC_CLASS___AppInstallPolicy), v6);
    if (sub_1002E656C(v9))
    {
      id v10 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      uint64_t v12 = -[SQLiteEntity initWithPersistentID:onConnection:](v10, "initWithPersistentID:onConnection:", a2, v11);

      sub_10021C8F4(v12, &stru_1003F3208);
    }
  }

  uint64_t v13 = objc_alloc(&OBJC_CLASS___AppInstallInfo);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
  id v15 = sub_10031DB1C(v13, v14, v5);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", @"IFNULL(app_install.phase, 10)"));
  uint64_t v17 = (uint64_t)[v16 integerValue];

  LOBYTE(v1_Block_object_dispose(va, 8) = v17 > 10;
  if (v17 != 50)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"coordinator_id"]);
    if (!v25)
    {
LABEL_34:
      sub_1001B4B5C(*(void **)(a1 + 32), v17, a2);
      if (!(_BYTE)v18)
      {
LABEL_60:

        goto LABEL_61;
      }

      id v48 = sub_1001E6B18((uint64_t)&OBJC_CLASS___AppPackageEntity, a2, *(void **)(a1 + 56));
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      id v50 = [v49 persistentID];
      if (v15) {
        v15[12] = v50;
      }
      sub_10031DCC4((uint64_t)&OBJC_CLASS___AppInstallInfo, v15);
      if (((1LL << (v17 + 40)) & 0x84000042100401LL) != 0)
      {
        uint64_t v51 = ASDLogHandleForCategory(2LL);
        unsigned int v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          if (v15) {
            id Property = objc_getProperty(v15, v53, 80LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v55 = Property;
          id v56 = sub_1002C9300(v17);
          id v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
          *(_DWORD *)buf = 138412546;
          id v89 = v55;
          __int16 v90 = 2114;
          uint64_t v91 = (uint64_t)v57;
          _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "[%@] Ignoring request to resume inactive installation in phase %{public}@",  buf,  0x16u);
        }

        goto LABEL_58;
      }

      if (v17 != 20)
      {
LABEL_45:
        if ((unint64_t)v17 > 0x2D || ((1LL << v17) & 0x210040000000LL) == 0)
        {
          uint64_t v72 = ASDLogHandleForCategory(2LL);
          id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            if (v15) {
              id v83 = objc_getProperty(v15, v74, 80LL, 1);
            }
            else {
              id v83 = 0LL;
            }
            id v84 = v83;
            *(_DWORD *)buf = 138412546;
            id v89 = v84;
            __int16 v90 = 2048;
            uint64_t v91 = v17;
          }

          unsigned int v52 = -[SQLiteEntity initWithPersistentID:onConnection:]( objc_alloc(&OBJC_CLASS___AppInstallEntity),  "initWithPersistentID:onConnection:",  a2,  *(void *)(a1 + 56));
          uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(v75);
          id v78 = *(id *)(a1 + 32);
          if (v78) {
            id v78 = objc_getProperty(v78, v76, 24LL, 1);
          }
          id v79 = v78;
          __int16 v80 = sub_10021BD0C(v52, v77);
          uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
          sub_1001EB714((uint64_t)v79, v81);

          goto LABEL_58;
        }
      }

      uint64_t v58 = ASDLogHandleForCategory(2LL);
      id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        if (v15) {
          id v61 = objc_getProperty(v15, v60, 80LL, 1);
        }
        else {
          id v61 = 0LL;
        }
        id v62 = v61;
        id v63 = sub_1002C9300(v17);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        *(_DWORD *)buf = 138412546;
        id v89 = v62;
        __int16 v90 = 2114;
        uint64_t v91 = (uint64_t)v64;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "[%@] Discovered previously active installation (phase = '%{public}@'), resetting state to Waiting for scheduling",  buf,  0x16u);
      }

      uint64_t v65 = *(void *)(a1 + 40);
      if (!v65) {
        goto LABEL_59;
      }
      id v66 = *(id *)(a1 + 32);
      id v67 = v15;
      id v68 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
      if (v15) {
        uint64_t v69 = v67[8];
      }
      else {
        uint64_t v69 = 0LL;
      }

      id v70 = (void *)objc_claimAutoreleasedReturnValue([v66 connection]);
      unsigned int v52 = -[SQLiteEntity initWithPersistentID:onConnection:](v68, "initWithPersistentID:onConnection:", v69, v70);

      uint64_t v71 = sub_1002CD12C(objc_alloc(&OBJC_CLASS___AppInstallPreambleTask), v52, v66);
      sub_1003197CC(v65, v71, v66);

LABEL_58:
LABEL_59:

      goto LABEL_60;
    }

    if (v15) {
      id v26 = objc_getProperty(v15, v24, 32LL, 1);
    }
    else {
      id v26 = 0LL;
    }
    id v27 = v26;

    if (v27)
    {
      id v86 = 0LL;
      if (v15)
      {
LABEL_16:
        id v29 = objc_getProperty(v15, v28, 32LL, 1);
        goto LABEL_17;
      }
    }

    else
    {
      uint64_t v85 = v25;
      if (v15)
      {
        id v36 = objc_getProperty(v15, v28, 40LL, 1);
        id v38 = objc_getProperty(v15, v37, 24LL, 1);
      }

      else
      {
        id v36 = 0LL;
        id v38 = 0LL;
      }

      id v39 = v38;
      id v87 = 0LL;
      id v40 = sub_1001E4948((uint64_t)&OBJC_CLASS___IXAppInstallCoordinator, v36, v39, &v87);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      id v86 = v87;
      if (v15) {
        objc_setProperty_atomic(v15, v42, v41, 32LL);
      }

      id v25 = v85;
      if (v15) {
        goto LABEL_16;
      }
    }

    id v29 = 0LL;
LABEL_17:
    id v30 = v29;

    if (v30)
    {
      id v31 = sub_1001F053C((uint64_t)&OBJC_CLASS___AppInstallObserver);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (v15) {
        id v34 = objc_getProperty(v15, v32, 32LL, 1);
      }
      else {
        id v34 = 0LL;
      }
      id v35 = v34;
      sub_1001F06D0((uint64_t)v33, v35);
    }

    else
    {
      uint64_t v43 = ASDLogHandleForCategory(2LL);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      if (v15) {
        id v82 = objc_getProperty(v15, v44, 80LL, 1);
      }
      else {
        id v82 = 0LL;
      }
      id v35 = v82;
      *(_DWORD *)buf = 138412546;
      id v89 = v35;
      __int16 v90 = 2114;
      uint64_t v91 = (uint64_t)v86;
      _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "[%@] Tried to replace the coordinator, but failed: %{public}@",  buf,  0x16u);
    }

LABEL_29:
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v25]);
    __int128 v46 = v45;
    if (v45)
    {
      unint64_t v47 = (unint64_t)[v45 integerValue];
      objc_opt_self(&OBJC_CLASS___AppInstallQueue);
      if (v47 > 5)
      {
        uint64_t v17 = 10LL;
      }

      else
      {
        unint64_t v18 = 0x101010000uLL >> (8 * v47);
        uint64_t v17 = qword_10038AAE0[v47];
      }
    }

    goto LABEL_34;
  }

  uint64_t v19 = ASDLogHandleForCategory(2LL);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      id v22 = objc_getProperty(v15, v21, 80LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    id v23 = v22;
    *(_DWORD *)buf = 138412290;
    id v89 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%@] Restarting from postamble", buf, 0xCu);
  }

  sub_100317D60(*(void *)(a1 + 40), v15, *(void **)(a1 + 32));
LABEL_61:
}

void sub_100317D54(id a1, AppInstallPolicy *a2)
{
}

void sub_100317D60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = a3;
    uint64_t v7 = ASDLogHandleForCategory(2LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (v5)
    {
      os_signpost_id_t v10 = v5[13];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        id v12 = objc_getProperty(v5, v11, 80LL, 1);
        *(_DWORD *)buf = 138543362;
        id v29 = v12;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "Install/Postamble",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
      }
    }

    uint64_t v13 = ASDLogHandleForCategory(2LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        id Property = objc_getProperty(v5, v15, 80LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v17 = Property;
      *(_DWORD *)buf = 138412290;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Beginning final", buf, 0xCu);
    }

    if (v5)
    {
      sub_1001B4B5C(v6, 50LL, v5[8]);
      uint64_t v18 = v5[8];
      uint64_t v19 = v5[12];
    }

    else
    {
      sub_1001B4B5C(v6, 50LL, 0LL);
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
    }

    id v20 = sub_100308C1C((uint64_t)&OBJC_CLASS___AppInstallPostambleTask, v18, v19, v6);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    id v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    uint64_t v24 = sub_100319458;
    id v25 = &unk_1003E9DC0;
    uint64_t v26 = a1;
    id v27 = v5;
    [v21 setCompletionBlock:&v22];
    objc_msgSend(*(id *)(a1 + 32), "addOperation:", v21, v22, v23, v24, v25, v26);
  }
}

uint64_t sub_10031893C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___AppPackageEntity);
  id v5 = [*(id *)(a1 + 32) longLongValue];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);

  uint64_t v7 = -[SQLiteEntity initWithPersistentID:onConnection:](v4, "initWithPersistentID:onConnection:", v5, v6);
  -[SQLiteEntity setValue:forProperty:](v7, "setValue:forProperty:", *(void *)(a1 + 40), @"data_promise_id");

  return 1LL;
}

void sub_100318BC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (v3) {
      uint64_t v4 = v3[3];
    }
    else {
      uint64_t v4 = 0LL;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v4));
    id v6 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v43[0] = 0LL;
    v43[1] = v43;
    void v43[2] = 0x3032000000LL;
    v43[3] = sub_100319BE8;
    void v43[4] = sub_100319BF8;
    id v44 = 0LL;
    uint64_t v37 = 0LL;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    id v40 = sub_100319BE8;
    uint64_t v41 = sub_100319BF8;
    id v42 = 0LL;
    uint64_t v8 = *(void **)(a1 + 16);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100319C00;
    v31[3] = &unk_1003F3230;
    id v9 = v7;
    id v32 = v9;
    os_signpost_id_t v10 = v3;
    id v33 = v10;
    uint64_t v34 = a1;
    id v35 = &v37;
    id v36 = v43;
    [v8 modifyUsingTransaction:v31];
    if (v38[5])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  1LL));
      if (v9) {
        id Property = objc_getProperty(v9, v11, 56LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v14 = Property;
      [v12 setUserInfoObject:v14 forKey:@"AppInstallExternalID"];

      [v12 becomeCurrentWithPendingUnitCount:1];
      id v15 = sub_1002B9EF0(*(_TtC9appstored12AssetPromise **)(a1 + 8), (void *)v38[5]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (v17)
      {
        if (v9) {
          objc_setProperty_atomic(v9, v16, v17, 16LL);
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        void v30[2] = sub_100319EA4;
        v30[3] = &unk_1003F3258;
        uint8_t v30[4] = v43;
        [v17 setProgress:v30];
        if (v9)
        {
          objc_setProperty_atomic(v9, v18, v12, 48LL);
          id v20 = objc_getProperty(v9, v19, 80LL, 1);
        }

        else
        {
          id v20 = 0LL;
        }

        id v21 = v20;
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
        unsigned int v23 = [v22 hasPrefix:@"LGY"];

        if (v23) {
          [v12 addObserver:a1 forKeyPath:@"fractionCompleted" options:5 context:0];
        }
        if (v3) {
          uint64_t v24 = v10[3];
        }
        else {
          uint64_t v24 = 0LL;
        }
        id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v24));
        uint64_t v26 = *(void **)(a1 + 40);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v17 requestID]);
        [v26 setObject:v25 forKeyedSubscript:v27];

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        void v28[2] = sub_100319F18;
        v28[3] = &unk_1003F3280;
        v28[4] = a1;
        id v29 = v9;
        [v17 addFinishBlock:v28];
      }

      [v12 resignCurrent];
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(v43, 8);
  }
}

void sub_100318F1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_100318F4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(v3 + 24);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100318FD0;
  v6[3] = &unk_1003E9DC0;
  id v7 = WeakRetained;
  uint64_t v8 = v3;
  id v5 = WeakRetained;
  dispatch_async(v4, v6);
}

void sub_100318FD0(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id Property = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v2, 88LL, 1);
    }
    id v5 = Property;
    sub_100318BC8(v4, v5);
  }

void sub_100319040(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = ASDLogHandleForCategory(2LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (v5)
    {
      os_signpost_id_t v10 = v5[13];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        id v12 = objc_getProperty(v5, v11, 80LL, 1);
        *(_DWORD *)buf = 138543362;
        id v32 = v12;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "Install/Install",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
      }
    }

    uint64_t v13 = ASDLogHandleForCategory(2LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        id Property = objc_getProperty(v5, v15, 80LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v17 = Property;
      *(_DWORD *)buf = 138412290;
      id v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Beginning installation", buf, 0xCu);
    }

    if (v5)
    {
      sub_1001B4B5C(v6, 40LL, v5[8]);
      uint64_t v18 = v5[8];
      uint64_t v19 = v5[12];
      id v21 = objc_getProperty(v5, v20, 32LL, 1);
    }

    else
    {
      sub_1001B4B5C(v6, 40LL, 0LL);
      uint64_t v19 = 0LL;
      uint64_t v18 = 0LL;
      id v21 = 0LL;
    }

    id v22 = v21;
    unsigned int v23 = sub_10030705C((uint64_t)&OBJC_CLASS___AppInstallInstallTask, v18, v19, v6, v22);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    objc_initWeak((id *)buf, v24);
    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    id v27 = sub_100319310;
    uint64_t v28 = &unk_1003EE018;
    objc_copyWeak(&v30, (id *)buf);
    uint64_t v29 = a1;
    [v24 setCompletionBlock:&v25];
    objc_msgSend(*(id *)(a1 + 32), "addOperation:", v24, v25, v26, v27, v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
}

void sub_1003192E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100319310(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(v3 + 24);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100319394;
  v6[3] = &unk_1003E9DC0;
  id v7 = WeakRetained;
  uint64_t v8 = v3;
  id v5 = WeakRetained;
  dispatch_async(v4, v6);
}

void sub_100319394(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id Property = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v2, 72LL, 1);
    }
    id v6 = Property;
    if (v4)
    {
      id v5 = *(void **)(v4 + 16);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10031A438;
      void v7[3] = &unk_1003EBCA0;
      id v8 = v6;
      uint64_t v9 = v4;
      [v5 modifyUsingTransaction:v7];
    }
  }

void sub_100319458(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(v1 + 24);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003194CC;
  v4[3] = &unk_1003E9DC0;
  void v4[4] = v1;
  id v5 = v2;
  dispatch_async(v3, v4);
}

void sub_1003194CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(id *)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = ASDLogHandleForCategory(2LL);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = v4;
    if (v2)
    {
      os_signpost_id_t v6 = v2[13];
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        LOWORD(v8[0]) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_END,  v6,  "Install/Postamble",  "",  (uint8_t *)v8,  2u);
      }
    }

    id v7 = *(void **)(v1 + 16);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    void v8[2] = sub_10031B554;
    v8[3] = &unk_1003EA9D8;
    uint64_t v9 = v2;
    [v7 modifyUsingTransaction:v8];
  }
}

void sub_1003195BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_signpost_id_t v6 = objc_alloc(&OBJC_CLASS___AppInstallInfo);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
  id v8 = sub_10031DB1C(v6, v7, v5);

  sub_10031DCC4((uint64_t)&OBJC_CLASS___AppInstallInfo, v8);
  uint64_t v9 = ASDLogHandleForCategory(2LL);
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if (v8)
  {
    os_signpost_id_t v12 = v8[13];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      id v14 = objc_getProperty(v8, v13, 80LL, 1);
      int v21 = 138543362;
      id v22 = v14;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "Install",  " uuid=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v21,  0xCu);
    }
  }

  id v15 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  id v17 = -[SQLiteEntity initWithPersistentID:onConnection:](v15, "initWithPersistentID:onConnection:", a2, v16);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 timeIntervalSinceReferenceDate];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[SQLiteEntity setValue:forProperty:](v17, "setValue:forProperty:", v19, @"last_start_date");

  SEL v20 = sub_1002CD12C(objc_alloc(&OBJC_CLASS___AppInstallPreambleTask), v17, *(void **)(a1 + 32));
  sub_1003197CC(*(void *)(a1 + 40), v20, *(void **)(a1 + 32));
}

void sub_1003197CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  os_signpost_id_t v6 = a3;
  if (!a1) {
    goto LABEL_20;
  }
  objc_initWeak(&location, v5);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  void v24[2] = sub_100319AD4;
  void v24[3] = &unk_1003EE018;
  objc_copyWeak(&v25, &location);
  void v24[4] = a1;
  [v5 setCompletionBlock:v24];
  if (v5) {
    id v7 = [v5[6] databaseID];
  }
  else {
    id v7 = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v7));
  id v9 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

  if (v10) {
    objc_storeWeak((id *)(v10 + 88), v5);
  }
  if (v5)
  {
    id v11 = [v5[8] databaseID];
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  id v11 = 0LL;
  if (v10) {
LABEL_8:
  }
    *(void *)(v10 + 96) = v11;
LABEL_9:
  uint64_t v12 = ASDLogHandleForCategory(2LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v10)
  {
    os_signpost_id_t v15 = *(void *)(v10 + 104);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      id v17 = objc_getProperty((id)v10, v16, 80LL, 1);
      *(_DWORD *)buf = 138543362;
      id v28 = v17;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "Install/Preamble",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
    }
  }

  uint64_t v18 = ASDLogHandleForCategory(2LL);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      id Property = objc_getProperty((id)v10, v20, 80LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v22 = Property;
    *(_DWORD *)buf = 138412290;
    id v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] Queuing preamble task", buf, 0xCu);
  }

  [*(id *)(a1 + 32) addOperation:v5];
  if (v5) {
    id v23 = [v5[6] databaseID];
  }
  else {
    id v23 = 0LL;
  }
  sub_1001B4B5C(v6, 20LL, (uint64_t)v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
LABEL_20:
}

void sub_100319A9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100319AD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v2 = [WeakRetained isCancelled];
  uint64_t v3 = WeakRetained;
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = sub_1002CD4E4(WeakRetained);
    os_signpost_id_t v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    if (v4)
    {
      if (v6) {
        uint64_t v7 = v6[1];
      }
      else {
        uint64_t v7 = 0LL;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v7));
      id v9 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      id v11 = *(void **)(v4 + 16);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      void v14[2] = sub_10031A9C0;
      void v14[3] = &unk_1003ECE98;
      id v15 = v10;
      uint64_t v16 = v6;
      uint64_t v17 = v4;
      id v12 = v10;
      [v11 modifyUsingTransaction:v14];
    }

    uint64_t v3 = WeakRetained;
  }
}

uint64_t sub_100319BE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100319BF8(uint64_t a1)
{
}

uint64_t sub_100319C00(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_storeWeak((id *)(v4 + 88), 0LL);
  }
  id v5 = objc_alloc(&OBJC_CLASS___AppPackageEntity);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 40);
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
  id v9 = -[SQLiteEntity initWithPersistentID:onConnection:](v5, "initWithPersistentID:onConnection:", v7, v8);

  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v10, 16LL, 1);
  }
  id v12 = Property;

  if (v12)
  {
    id v14 = *(id *)(a1 + 40);
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 16LL, 1);
    }
    id v15 = v14;
    -[SQLiteEntity setValue:forProperty:](v9, "setValue:forProperty:", v15, @"bytes_total");
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    uint64_t v17 = *(void *)(v16 + 48);
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v17));
  -[SQLiteEntity setValue:forProperty:](v9, "setValue:forProperty:", v18, @"request_count");

  SEL v20 = *(void **)(a1 + 40);
  if (!v20)
  {
    id v22 = 0LL;
    goto LABEL_18;
  }

  uint64_t v21 = v20[7];
  switch(v21)
  {
    case 2LL:
      sub_100319040(*(void *)(a1 + 48), *(void **)(a1 + 32), v3);
      break;
    case 1LL:
      uint64_t v37 = *(void *)(a1 + 32);
      if (v37) {
        uint64_t v38 = *(void *)(v37 + 64);
      }
      else {
        uint64_t v38 = 0LL;
      }
      id v25 = objc_getProperty(v20, v19, 32LL, 1);
      if (v3) {
        sub_1001B1ABC((id *)v3, v38, v25, 0);
      }
      goto LABEL_30;
    case 0LL:
      id v22 = objc_getProperty(v20, v19, 8LL, 1);
LABEL_18:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v22);
      id v24 = *(id *)(a1 + 40);
      if (v24) {
        id v24 = objc_getProperty(v24, v23, 64LL, 1);
      }
      id v25 = v24;
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___CoordinatorPromiseDataConsumer, v26);
      if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0) {
        sub_100194DD0((uint64_t)v25, *(void **)(a1 + 48));
      }
      id v28 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
      uint64_t v29 = *(void *)(a1 + 40);
      if (v29) {
        uint64_t v30 = *(void *)(v29 + 24);
      }
      else {
        uint64_t v30 = 0LL;
      }
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
      id v32 = -[SQLiteEntity initWithPersistentID:onConnection:](v28, "initWithPersistentID:onConnection:", v30, v31);

      id v33 = sub_1001E26D0(v32, (uint64_t)@"bundle_id");
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
      uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v36 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;

LABEL_30:
      break;
  }

  return 1LL;
}

void sub_100319EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = sub_1002B0944((uint64_t)&OBJC_CLASS___ProgressCache);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v11 = (id)v9;
  if (a2) {
    sub_1002B24F8(v9, v10, a3);
  }
  else {
    sub_1002B225C(v9, v10, a3, a4);
  }
}

void sub_100319F18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v53 = a2;
  id v6 = a3;
  id v7 = v4;
  uint64_t v9 = v7;
  uint64_t v52 = v5;
  if (!v5) {
    goto LABEL_44;
  }
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, 0LL, 16LL);
    id v10 = v9;
    id v13 = objc_getProperty(v10, v11, 48LL, 1);
    if (v13)
    {
      id v14 = objc_getProperty(v10, v12, 80LL, 1);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
      unsigned int v16 = [v15 hasPrefix:@"LGY"];

      if (v16) {
        [v13 removeObserver:v52 forKeyPath:@"fractionCompleted"];
      }
      objc_setProperty_atomic(v10, v17, 0LL, 48LL);
    }
  }

  else
  {
    id v13 = 0LL;
  }

  id v54 = v53;
  id v18 = v9;
  if (os_variant_has_internal_content("com.apple.appstored"))
  {
    self = v18;
    if (!v9)
    {
      id v40 = 0LL;
      id v50 = 0LL;
      goto LABEL_34;
    }

    id v50 = objc_getProperty(v18, v19, 80LL, 1);
    id v21 = objc_getProperty(v18, v20, 24LL, 1);
    if (!v21)
    {
      id v40 = 0LL;
LABEL_34:

      id v18 = self;
      goto LABEL_35;
    }

    __int128 v49 = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v50 description]);
    unsigned int v23 = [v22 hasPrefix:@"UPA"];

    if (!v23)
    {
LABEL_33:
      id v40 = v49;
      goto LABEL_34;
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id Property = v54;
    if (v54) {
      id Property = objc_getProperty(v54, v24, 40LL, 1);
    }
    id v26 = Property;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 transactionMetrics]);

    id v28 = [v27 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v28)
    {
      id v29 = 0LL;
      id v30 = 0LL;
      uint64_t v31 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v27);
          }
          id v33 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          if (!v29)
          {
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v59 + 1) + 8 * (void)i) requestStartDate]);
            BOOL v35 = v34 == 0LL;

            if (v35) {
              id v29 = 0LL;
            }
            else {
              id v29 = (id)objc_claimAutoreleasedReturnValue([v33 requestStartDate]);
            }
          }

          id v36 = (void *)objc_claimAutoreleasedReturnValue([v33 responseEndDate]);

          if (v36)
          {
            uint64_t v37 = objc_claimAutoreleasedReturnValue([v33 responseEndDate]);

            id v30 = (id)v37;
          }
        }

        id v28 = [v27 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }

      while (v28);

      if (!v29 || !v30) {
        goto LABEL_32;
      }
      id v38 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_10031C52C;
      v55[3] = &unk_1003F3338;
      id v29 = v29;
      id v56 = v29;
      id v30 = v30;
      id v57 = v30;
      id v58 = v49;
      [v39 modifyUsingTransaction:v55];

      uint64_t v27 = v56;
    }

    else
    {
      id v30 = 0LL;
      id v29 = 0LL;
    }

LABEL_32:
    goto LABEL_33;
  }

void sub_10031A418( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10031A438(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 8);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v5));
  id v7 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    switch(v10[3])
    {
      case 0LL:
        goto LABEL_5;
      case 1LL:
        uint64_t v20 = ASDLogHandleForCategory(2LL);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        if (v8) {
          id Property = objc_getProperty(v8, v21, 80LL, 1);
        }
        else {
          id Property = 0LL;
        }
        unsigned int v23 = (os_log_s *)Property;
        int v51 = 138412290;
        uint64_t v52 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] Waiting for installation to complete",  (uint8_t *)&v51,  0xCu);
        goto LABEL_45;
      case 2LL:
        if (v8) {
          uint64_t v18 = v8[8];
        }
        else {
          uint64_t v18 = 0LL;
        }
        id v19 = objc_getProperty(v10, v9, 16LL, 1);
        if (v3) {
          sub_1001B1ABC(v3, v18, v19, 0);
        }

        goto LABEL_47;
      case 3LL:
        sub_100317D60(*(void *)(a1 + 40), v8, v3);
        goto LABEL_47;
      case 4LL:
        uint64_t v24 = ASDLogHandleForCategory(2LL);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            id v27 = objc_getProperty(v8, v26, 80LL, 1);
          }
          else {
            id v27 = 0LL;
          }
          id v28 = (os_log_s *)v27;
          int v51 = 138412290;
          uint64_t v52 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[%@] Advancing installation phase to post-processing",  (uint8_t *)&v51,  0xCu);
        }

        id v29 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
        uint64_t v30 = *(void *)(a1 + 32);
        if (v30) {
          uint64_t v31 = *(void *)(v30 + 8);
        }
        else {
          uint64_t v31 = 0LL;
        }
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
        id v15 = -[SQLiteEntity initWithPersistentID:onConnection:](v29, "initWithPersistentID:onConnection:", v31, v32);

        -[os_log_s setValue:forProperty:](v15, "setValue:forProperty:", &off_10040D3C0, @"phase");
        break;
      case 6LL:
        uint64_t v35 = ASDLogHandleForCategory(2LL);
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            id v38 = objc_getProperty(v8, v37, 80LL, 1);
          }
          else {
            id v38 = 0LL;
          }
          uint64_t v39 = (os_log_s *)v38;
          int v51 = 138412290;
          uint64_t v52 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[%@] Installation has been scheduled",  (uint8_t *)&v51,  0xCu);
        }

        id v40 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
        uint64_t v41 = *(void *)(a1 + 32);
        if (v41) {
          uint64_t v42 = *(void *)(v41 + 8);
        }
        else {
          uint64_t v42 = 0LL;
        }
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v3 connection]);
        id v15 = -[SQLiteEntity initWithPersistentID:onConnection:](v40, "initWithPersistentID:onConnection:", v42, v43);

        if (sub_1001E2698(v15, (uint64_t)@"IFNULL(app_install.phase, 10)") == (id)40)
        {
          -[os_log_s setValue:forProperty:](v15, "setValue:forProperty:", &off_10040D3A8, @"phase");
          if (v3)
          {
            __int128 v45 = (os_log_s *)objc_getProperty(v3, v44, 24LL, 1);
            unsigned int v23 = v45;
            if (v45) {
              *((void *)v45 + 16) |= 0x20000uLL;
            }
          }

          else
          {
            unsigned int v23 = 0LL;
          }
        }

        else
        {
          uint64_t v46 = ASDLogHandleForCategory(2LL);
          unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            if (v8) {
              id v48 = objc_getProperty(v8, v47, 80LL, 1);
            }
            else {
              id v48 = 0LL;
            }
            __int128 v49 = (os_log_s *)v48;
            int v51 = 138412290;
            uint64_t v52 = v49;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%@] Installation is already complete",  (uint8_t *)&v51,  0xCu);
          }
        }

void sub_10031A9B4(id a1, AppInstallPolicy *a2)
{
}

uint64_t sub_10031A9C0(uint64_t a1, void *a2)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    objc_storeWeak((id *)(v5 + 88), 0LL);
  }
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 16LL, 1);
  }
  id v7 = Property;

  if (v7)
  {
    id v9 = *(id *)(a1 + 40);
    if (v9) {
      id v9 = objc_getProperty(v9, v8, 16LL, 1);
    }
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 64);
    }
    else {
      uint64_t v12 = 0LL;
    }
    sub_1001B52D0(v4, v10, v12);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    switch(*(void *)(v13 + 32))
    {
      case 0LL:
        goto LABEL_13;
      case 1LL:
        uint64_t v39 = ASDLogHandleForCategory(2LL);
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        uint64_t v41 = v40;
        uint64_t v42 = *(void **)(a1 + 32);
        if (v42)
        {
          os_signpost_id_t v43 = v42[13];
          if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            id v46 = objc_getProperty(v42, v44, 80LL, 1);
            id v47 = *(id *)(a1 + 40);
            if (v47) {
              id v47 = objc_getProperty(v47, v45, 24LL, 1);
            }
            id v48 = v47;
            id v49 = sub_100298F48(v48);
            id v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v50;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v41,  OS_SIGNPOST_INTERVAL_END,  v43,  "Install/Preamble",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
          }
        }

        uint64_t v51 = ASDLogHandleForCategory(2LL);
        uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          id v54 = *(id *)(a1 + 32);
          if (v54) {
            id v54 = objc_getProperty(v54, v53, 80LL, 1);
          }
          id v56 = v54;
          id v57 = *(id *)(a1 + 40);
          if (v57) {
            id v57 = objc_getProperty(v57, v55, 16LL, 1);
          }
          id v58 = v57;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "[%@] Preflight succeeded with coordinator: %{public}@",  buf,  0x16u);
        }

        id v60 = *(id *)(a1 + 40);
        if (v60) {
          id v60 = objc_getProperty(v60, v59, 16LL, 1);
        }
        id v62 = v60;
        id v63 = *(void **)(a1 + 32);
        if (v63) {
          objc_setProperty_atomic(v63, v61, v62, 32LL);
        }

        id v65 = *(id *)(a1 + 40);
        if (v65) {
          id v65 = objc_getProperty(v65, v64, 16LL, 1);
        }
        id v66 = v65;

        if (v66)
        {
          id v67 = sub_1001F053C((uint64_t)&OBJC_CLASS___AppInstallObserver);
          uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(v67);
          id v70 = *(id *)(a1 + 40);
          if (v70) {
            id v70 = objc_getProperty(v70, v68, 16LL, 1);
          }
          id v71 = v70;
          sub_1001F06D0((uint64_t)v69, v71);
        }

        uint64_t v72 = *(void *)(a1 + 32);
        if (v72) {
          uint64_t v73 = *(void *)(v72 + 64);
        }
        else {
          uint64_t v73 = 0LL;
        }
        sub_1001B4B5C(v4, 30LL, v73);
        uint64_t v74 = *(void *)(a1 + 48);
        id v75 = *(id *)(a1 + 32);
        id v76 = v4;
        if (!v74) {
          goto LABEL_98;
        }
        uint64_t v77 = ASDLogHandleForCategory(2LL);
        id v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        id v79 = v78;
        if (v75)
        {
          os_signpost_id_t v80 = *((void *)v75 + 13);
          if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
          {
            id v82 = objc_getProperty(v75, v81, 80LL, 1);
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v82;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v79,  OS_SIGNPOST_INTERVAL_BEGIN,  v80,  "Install/Download",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
          }
        }

        uint64_t v83 = ASDLogHandleForCategory(2LL);
        id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          if (v75) {
            id v86 = objc_getProperty(v75, v85, 80LL, 1);
          }
          else {
            id v86 = 0LL;
          }
          id v87 = v86;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v87;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "[%@] Beginning downloading", buf, 0xCu);
        }

        if (!os_variant_has_internal_content("com.apple.appstored")
          || !sub_1002FA1A8((uint64_t)&OBJC_CLASS___AppDefaultsManager))
        {
          goto LABEL_92;
        }

        if (v75) {
          id v89 = (void *)*((void *)v75 + 8);
        }
        else {
          id v89 = 0LL;
        }
        __int16 v90 = (void *)objc_claimAutoreleasedReturnValue([v76 connection]);
        id v91 = sub_1001E6B18((uint64_t)&OBJC_CLASS___AppPackageEntity, (uint64_t)v89, v90);
        __int128 v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
        if (sub_1001E2698(v92, (uint64_t)@"package_type") == (id)1)
        {
          uint64_t v93 = ASDLogHandleForCategory(2LL);
          __int128 v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            if (v75) {
              id v96 = objc_getProperty(v75, v95, 80LL, 1);
            }
            else {
              id v96 = 0LL;
            }
            id v97 = v96;
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v97;
            _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "[%@] Forcing failure of delta update (expect further error messages prior to expected retry with full update)…",  buf,  0xCu);
          }

          uint64_t v98 = ASDErrorWithDescription(ASDErrorDomain, 921LL, @"Forced failure of delta-package download");
          __int128 v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
          __int128 v100 = sub_10020A82C((uint64_t)&OBJC_CLASS___AppInstallDownloadResponse, v89, v99);
          __int128 v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
          sub_100318BC8(v74, v101);
        }

        else
        {

LABEL_92:
          if (v75)
          {
            uint64_t v131 = *((void *)v75 + 8);
            id v132 = objc_getProperty(v75, v88, 32LL, 1);
          }

          else
          {
            uint64_t v131 = 0LL;
            id v132 = 0LL;
          }

          id v133 = v132;
          v134 = sub_100208EDC((uint64_t)&OBJC_CLASS___AppInstallDownloadTask, v131, v76, v133);
          __int16 v90 = (void *)objc_claimAutoreleasedReturnValue(v134);

          objc_initWeak(&location, v90);
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472LL;
          *(void *)&uint8_t buf[16] = sub_100318F4C;
          v145 = &unk_1003EE018;
          objc_copyWeak(v147, &location);
          uint64_t v146 = v74;
          [v90 setCompletionBlock:buf];
          if (v75) {
            objc_storeWeak((id *)v75 + 11, v90);
          }
          [*(id *)(v74 + 32) addOperation:v90];
          objc_destroyWeak(v147);
          objc_destroyWeak(&location);
        }

LABEL_98:
        break;
      case 2LL:
        uint64_t v102 = ASDLogHandleForCategory(2LL);
        id v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
        unsigned int v104 = v103;
        v105 = *(void **)(a1 + 32);
        if (v105)
        {
          os_signpost_id_t v106 = v105[13];
          if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
          {
            id v109 = objc_getProperty(v105, v107, 80LL, 1);
            id v110 = *(id *)(a1 + 40);
            if (v110) {
              id v110 = objc_getProperty(v110, v108, 24LL, 1);
            }
            id v111 = v110;
            id v112 = sub_100298F48(v111);
            __int128 v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v109;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v113;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v104,  OS_SIGNPOST_INTERVAL_END,  v106,  "Install/Preamble",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
          }
        }

        uint64_t v114 = ASDLogHandleForCategory(2LL);
        __int128 v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          id v138 = *(id *)(a1 + 32);
          if (v138) {
            id v138 = objc_getProperty(v138, v116, 80LL, 1);
          }
          id v140 = v138;
          id v141 = *(id *)(a1 + 40);
          if (v141) {
            id v141 = objc_getProperty(v141, v139, 24LL, 1);
          }
          id v142 = v141;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v140;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v142;
          _os_log_error_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_ERROR,  "[%@] Preflight failed with error: %{public}@",  buf,  0x16u);
        }

        __int128 v118 = *(void **)(a1 + 40);
        if (v118)
        {
          uint64_t v119 = v118[1];
          __int128 v118 = objc_getProperty(v118, v117, 24LL, 1);
        }

        else
        {
          uint64_t v119 = 0LL;
        }

        id v120 = v118;
        if (v4) {
          sub_1001B1ABC((id *)v4, v119, v120, 0);
        }

        break;
      case 3LL:
        uint64_t v121 = ASDLogHandleForCategory(2LL);
        v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
        NSErrorUserInfoKey v123 = v122;
        __int16 v124 = *(void **)(a1 + 32);
        if (v124)
        {
          os_signpost_id_t v125 = v124[13];
          if (v125 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
          {
            id v127 = objc_getProperty(v124, v126, 80LL, 1);
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v127;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v123,  OS_SIGNPOST_INTERVAL_END,  v125,  "Install/Preamble",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
          }
        }

        uint64_t v128 = ASDLogHandleForCategory(2LL);
        __int16 v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          id v136 = *(id *)(a1 + 32);
          if (v136) {
            id v136 = objc_getProperty(v136, v130, 80LL, 1);
          }
          id v137 = v136;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v137;
          _os_log_error_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_ERROR,  "[%@] Preflight finished and will proceed to installation",  buf,  0xCu);
        }

        sub_100319040(*(void *)(a1 + 48), *(void **)(a1 + 32), v4);
        break;
      default:
        break;
    }
  }

  else
  {
LABEL_13:
    uint64_t v14 = ASDLogHandleForCategory(2LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    unsigned int v16 = v15;
    uint64_t v17 = *(void **)(a1 + 32);
    if (v17)
    {
      os_signpost_id_t v18 = v17[13];
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        id v21 = objc_getProperty(v17, v19, 80LL, 1);
        id v22 = *(id *)(a1 + 40);
        if (v22) {
          id v22 = objc_getProperty(v22, v20, 24LL, 1);
        }
        id v23 = v22;
        id v24 = sub_100298F48(v23);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_END,  v18,  "Install/Preamble",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
      }
    }

    uint64_t v26 = ASDLogHandleForCategory(2LL);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = *(id *)(a1 + 32);
      if (v29) {
        id v29 = objc_getProperty(v29, v28, 80LL, 1);
      }
      id v31 = v29;
      id v32 = *(id *)(a1 + 40);
      if (v32) {
        id v32 = objc_getProperty(v32, v30, 16LL, 1);
      }
      id v34 = v32;
      id v35 = *(id *)(a1 + 40);
      if (v35) {
        id v35 = objc_getProperty(v35, v33, 24LL, 1);
      }
      id v36 = v35;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2114;
      v145 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[%@] Preflight canceled with coordinator: %{public}@ error: %{public}@",  buf,  0x20u);
    }

    uint64_t v37 = *(void *)(a1 + 40);
    if (v37) {
      uint64_t v38 = *(void *)(v37 + 8);
    }
    else {
      uint64_t v38 = 0LL;
    }
    sub_1001B345C((id *)v4, v38, (NSError *)0xFFFFFFFFFFFFFFE2LL);
  }

  return 1LL;
}

void sub_10031B51C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t sub_10031B554(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = *(void *)(v3 + 64);
  }
  else {
    uint64_t v6 = 0LL;
  }
  sub_1001B345C(v4, v6, (NSError *)0xFFFFFFFFFFFFFFD8LL);

  sub_10031DD7C((uint64_t)&OBJC_CLASS___AppInstallInfo, *(void **)(a1 + 32));
  return 1LL;
}

uint64_t sub_10031B5B8(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = objc_getProperty(v5, v3, 48LL, 1);
    if (v6)
    {
      id v7 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        uint64_t v9 = *(void *)(v8 + 64);
      }
      else {
        uint64_t v9 = 0LL;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
      uint64_t v11 = -[SQLiteEntity initWithPersistentID:onConnection:](v7, "initWithPersistentID:onConnection:", v9, v10);

      -[SQLiteEntity setValue:forProperty:](v11, "setValue:forProperty:", v6, @"metrics_fields");
    }
  }

  else
  {
    id v6 = 0LL;
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v12 = ASDLogHandleForCategory(2LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = v13;
    id v15 = *(void **)(a1 + 40);
    if (v15)
    {
      os_signpost_id_t v16 = v15[13];
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        id v18 = objc_getProperty(v15, v17, 80LL, 1);
        id v19 = sub_100298F48(*(id *)(a1 + 48));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v20;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_END,  v16,  "Install/Download",  " uuid=%{public, signpost.description:attribute}@  error=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
      }
    }

    if (ASDErrorIsEqual(*(void *)(a1 + 48), NSCocoaErrorDomain, 3072LL))
    {
      uint64_t v21 = ASDLogHandleForCategory(2LL);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id Property = *(id *)(a1 + 40);
        if (Property) {
          id Property = objc_getProperty(Property, v23, 80LL, 1);
        }
        id v25 = Property;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@] Download canceled", buf, 0xCu);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
      goto LABEL_116;
    }

    uint64_t v40 = *(void *)(a1 + 56);
    uint64_t v42 = *(void **)(a1 + 32);
    uint64_t v41 = *(void **)(a1 + 40);
    self = *(_BYTE **)(*(void *)(a1 + 64) + 8LL);
    id v136 = *(id *)(a1 + 48);
    os_signpost_id_t v43 = v41;
    v135 = v42;
    id v137 = v4;
    if (!v40)
    {
LABEL_115:

LABEL_116:
      sub_10031DD7C((uint64_t)&OBJC_CLASS___AppInstallInfo, *(void **)(a1 + 40));
      goto LABEL_117;
    }

    uint64_t v44 = ASDLogHandleForCategory(2LL);
    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      if (v43) {
        id v47 = objc_getProperty(v43, v46, 80LL, 1);
      }
      else {
        id v47 = 0LL;
      }
      id v48 = v47;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v136;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[%@] Download failed with error: %{public}@",  buf,  0x16u);
    }

    id v49 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
    if (v43) {
      uint64_t v50 = v43[8];
    }
    else {
      uint64_t v50 = 0LL;
    }
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v137 connection]);
    uint64_t v52 = -[SQLiteEntity initWithPersistentID:onConnection:](v49, "initWithPersistentID:onConnection:", v50, v51);

    if (!sub_1001E2698(v52, (uint64_t)@"source_type")
      && ASDErrorIsEqual(v136, @"AssetErrorDomain", 6LL))
    {
      id v53 = v52;
      selfa = v43;
      id v131 = v137;
      uint64_t v54 = (uint64_t)sub_1001E2698(v53, (uint64_t)@"recovery_count");
      unsigned __int8 v55 = sub_10021B578(v53);
      if (v54 < 1) {
        char v56 = 1;
      }
      else {
        char v56 = v55;
      }
      char v129 = v56;
      if ((v56 & 1) != 0)
      {
        if (v54 >= 2)
        {

          goto LABEL_108;
        }

        uint64_t v57 = ASDLogHandleForCategory(2LL);
        oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          if (v43) {
            id v59 = objc_getProperty(selfa, v58, 80LL, 1);
          }
          else {
            id v59 = 0LL;
          }
          id v60 = v59;
          *(_DWORD *)v143 = 138412290;
          *(void *)&v143[4] = v60;
          _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "[%@] Attempting expired download recovery for update",  v143,  0xCu);
        }

        if (v54 >= 1) {
          uint64_t v61 = v54 + 1;
        }
        else {
          uint64_t v61 = 1LL;
        }
        id v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v61));
        -[SQLiteEntity setValue:forProperty:](v53, "setValue:forProperty:", v62, @"recovery_count");

        id v63 = sub_1001D94D8((uint64_t)&OBJC_CLASS___ExpiredUpdateRecoveryTask, v53);
        id v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        objc_initWeak((id *)v143, v64);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_10031C438;
        v139 = &unk_1003F3310;
        objc_copyWeak(v142, (id *)v143);
        uint64_t v140 = v40;
        id v141 = selfa;
        [v64 setCompletionBlock:buf];
        id v65 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
        uint64_t v66 = objc_claimAutoreleasedReturnValue(v65);
        id v67 = (void *)v66;
        if (v66) {
          [*(id *)(v66 + 8) addOperation:v64];
        }

        objc_destroyWeak(v142);
        objc_destroyWeak((id *)v143);
      }

      else
      {
        uint64_t v110 = ASDLogHandleForCategory(2LL);
        id v64 = (void *)objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_DEFAULT))
        {
          if (v43) {
            id v112 = objc_getProperty(selfa, v111, 80LL, 1);
          }
          else {
            id v112 = 0LL;
          }
          id v113 = v112;
          *(_DWORD *)v143 = 138412290;
          *(void *)&v143[4] = v113;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v64,  OS_LOG_TYPE_DEFAULT,  "[%@] Expired download recovery for user-initiated update has already been attempted",  v143,  0xCu);
        }
      }

      if ((v129 & 1) != 0) {
        goto LABEL_114;
      }
LABEL_108:
      uint64_t v116 = ASDLogHandleForCategory(2LL);
      __int128 v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        if (v43) {
          id v124 = objc_getProperty(selfa, v118, 80LL, 1);
        }
        else {
          id v124 = 0LL;
        }
        id v125 = v124;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v125;
        _os_log_error_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_ERROR,  "[%@] Cannot recover from expired download for this installation",  buf,  0xCu);
      }

      if (v43) {
        uint64_t v119 = selfa[8];
      }
      else {
        uint64_t v119 = 0LL;
      }
      if (v135) {
        char v120 = v135[8] & 1;
      }
      else {
        char v120 = 0;
      }
      sub_1001B1ABC((id *)v131, v119, v136, v120);
      goto LABEL_114;
    }

    id v68 = v136;
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v68 domain]);
    unsigned int v70 = [v69 isEqualToString:NSURLErrorDomain];

    if (v70)
    {
      id v71 = [v68 code];
      if ((unint64_t)v71 + 1009 <= 8 && ((1LL << (v71 - 15)) & 0x111) != 0)
      {

        uint64_t v72 = v43;
        uint64_t v73 = v137;
        uint64_t v74 = v52;
        id v75 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
        id v132 = (void *)objc_claimAutoreleasedReturnValue(v75);
        id v76 = sub_10021B7AC(v74);
        unint64_t v130 = (void *)objc_claimAutoreleasedReturnValue(v76);

        if ([v132 isExpensive]
          && (uint64_t v77 = sub_1002E6130((id *)v130), (unint64_t)v77 <= 4)
          && ((1LL << (char)v77) & 0x15) != 0)
        {
          uint64_t v78 = ASDLogHandleForCategory(2LL);
          id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            if (v43) {
              id v81 = objc_getProperty(v72, v80, 80LL, 1);
            }
            else {
              id v81 = 0LL;
            }
            id v82 = v81;
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v82;
            _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_INFO,  "[%@] Pausing download - policy prevents expensive networks",  buf,  0xCu);
          }
        }

        else
        {
          if (![v132 isConstrained]
            || (__int128 v92 = sub_1002E6090((id *)v130), (unint64_t)v92 > 4)
            || ((1LL << (char)v92) & 0x15) == 0)
          {
            if (v43) {
              uint64_t v109 = (uint64_t)v72[8];
            }
            else {
              uint64_t v109 = 0LL;
            }
            sub_1001B2B88(v73, v109);
LABEL_94:

LABEL_114:
            goto LABEL_115;
          }

          uint64_t v93 = ASDLogHandleForCategory(2LL);
          id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            if (v43) {
              id v95 = objc_getProperty(v72, v94, 80LL, 1);
            }
            else {
              id v95 = 0LL;
            }
            id v96 = v95;
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v96;
            _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_INFO,  "[%@] Pausing download - policy prevents constrained networks",  buf,  0xCu);
          }
        }

        if (v43)
        {
          sub_1001B47BC((id *)v73, v72[8], -15LL, 3uLL);
          id v98 = objc_getProperty(v72, v97, 32LL, 1);
        }

        else
        {
          sub_1001B47BC((id *)v73, 0LL, -15LL, 3uLL);
          id v98 = 0LL;
        }

        id v99 = v98;
        *(void *)v143 = 0LL;
        unsigned __int8 v100 = [v99 pauseWithError:v143];
        id v101 = *(id *)v143;

        if ((v100 & 1) == 0)
        {
          uint64_t v102 = ASDLogHandleForCategory(2LL);
          id v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            if (v43) {
              id v126 = objc_getProperty(v72, v104, 80LL, 1);
            }
            else {
              id v126 = 0LL;
            }
            id v127 = v126;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v127;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v101;
            _os_log_error_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_ERROR,  "[%@] Failed to pause for policy error: %{public}@",  buf,  0x16u);
          }
        }

        self[24] = 1;

        goto LABEL_94;
      }
    }

    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v68 domain]);
    unsigned int v84 = [v83 isEqualToString:SZExtractorErrorDomain];

    if (!v84)
    {
      if (v43) {
        uint64_t v90 = v43[8];
      }
      else {
        uint64_t v90 = 0LL;
      }
      if (v135) {
        char v91 = v135[8] & 1;
      }
      else {
        char v91 = 0;
      }
      sub_1001B1ABC((id *)v137, v90, v68, v91);
      self[24] = 1;
      goto LABEL_114;
    }

    id v85 = sub_10021B984(v52);
    id v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
    if (sub_1001E2698(v86, (uint64_t)@"package_type") == (id)1)
    {
      uint64_t v87 = ASDLogHandleForCategory(2LL);
      __int128 v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        if (v43) {
          id v122 = objc_getProperty(v43, v89, 80LL, 1);
        }
        else {
          id v122 = 0LL;
        }
        id v123 = v122;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v123;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v68;
        _os_log_error_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_ERROR,  "[%@] Ignoring data promise failure to wait for delta recovery error: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      if ([v68 code] != (id)4 && objc_msgSend(v68, "code") != (id)2 || v135 && (v135[8] & 1) != 0)
      {
        if (v43) {
          uint64_t v114 = v43[8];
        }
        else {
          uint64_t v114 = 0LL;
        }
        if (v135) {
          char v115 = v135[8] & 1;
        }
        else {
          char v115 = 0;
        }
        sub_1001B1ABC((id *)v137, v114, v68, v115);
        goto LABEL_106;
      }

      uint64_t v105 = ASDLogHandleForCategory(2LL);
      __int128 v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        if (v43) {
          id v107 = objc_getProperty(v43, v106, 80LL, 1);
        }
        else {
          id v107 = 0LL;
        }
        id v108 = v107;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v108;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v68;
        _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_INFO,  "[%@] Ignoring data promise failure to wait for corrupt asset cache recovery error: %{public}@",  buf,  0x16u);
      }
    }

LABEL_106:
    self[24] = 1;

    goto LABEL_114;
  }

  uint64_t v26 = *(void *)(a1 + 56);
  id v27 = *(id *)(a1 + 40);
  if (v26)
  {
    id v28 = v4;
    uint64_t v29 = ASDLogHandleForCategory(2LL);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    if (v27)
    {
      os_signpost_id_t v32 = v27[13];
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        id v34 = objc_getProperty(v27, v33, 80LL, 1);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v34;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v32,  "Install/Download",  " uuid=%{public, signpost.description:attribute}@ ",  buf,  0xCu);
      }
    }

    id v35 = objc_alloc(&OBJC_CLASS___AppInstallEntity);
    if (v27) {
      uint64_t v36 = v27[8];
    }
    else {
      uint64_t v36 = 0LL;
    }
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v28 connection]);
    uint64_t v38 = -[SQLiteEntity initWithPersistentID:onConnection:](v35, "initWithPersistentID:onConnection:", v36, v37);

    sub_1001E2698(v38, (uint64_t)@"source_type");
    sub_10021C8F4(v38, &stru_1003F32E8);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[SQLiteEntity setValue:forProperty:](v38, "setValue:forProperty:", v39, @"optimal_download_start");

    sub_100319040(v26, v27, v28);
  }

LABEL_117:
  return 1LL;
}

void sub_10031C3CC(_Unwind_Exception *a1)
{
}

void sub_10031C3F4(id a1, AppInstallPolicy *a2)
{
  uint64_t v2 = a2;
  sub_1002E62D4((uint64_t)v2, 0LL);
  sub_1002E6510((uint64_t)v2, 0LL);
  sub_1002E5F20((uint64_t)v2, 0LL);
}

void sub_10031C438(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = WeakRetained[24] & 1;
    id WeakRetained = objc_getProperty(WeakRetained, v3, 32LL, 1);
  }

  else
  {
    char v5 = 0;
  }

  id v6 = WeakRetained;
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = v6;
  id v9 = v7;
  id v10 = v9;
  if (v4)
  {
    uint64_t v11 = *(void **)(v4 + 16);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_10031C540;
    v13[3] = &unk_1003F3360;
    char v16 = v5;
    id v14 = v9;
    id v15 = v8;
    objc_msgSend(v11, "modifyUsingTransaction:", v13, v12);
  }
}

uint64_t sub_10031C52C(void **a1, void *a2)
{
  return sub_1002A1188(a2, a1[4], a1[5], a1[6]);
}

uint64_t sub_10031C540(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = a2;
  uint64_t v5 = ASDLogHandleForCategory(2LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v7)
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v8, 80LL, 1);
      }
      id v14 = Property;
      uint64_t v15 = *(void *)(a1 + 40);
      int v19 = 138412546;
      id v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] Failing after unsuccessful recovery error %{public}@",  (uint8_t *)&v19,  0x16u);
    }

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16)
    {
      uint64_t v17 = *(void *)(v16 + 64);
      if (!v4) {
        goto LABEL_16;
      }
    }

    else
    {
      uint64_t v17 = 0LL;
      if (!v4) {
        goto LABEL_16;
      }
    }

    sub_1001B1ABC(v4, v17, *(void **)(a1 + 40), 0);
    goto LABEL_16;
  }

  if (v7)
  {
    id v9 = *(id *)(a1 + 32);
    if (v9) {
      id v9 = objc_getProperty(v9, v8, 80LL, 1);
    }
    id v10 = v9;
    int v19 = 138412290;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] Restarting after successful recovery",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 64);
  }
  else {
    uint64_t v12 = 0LL;
  }
  sub_1001B2B88(v4, v12);
LABEL_16:

  return 1LL;
}

id sub_10031C730(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v5));
  sub_10031C7BC(v6);
  sub_10031C84C(v6, v3);

  return v6;
}

void sub_10031C7BC(void *a1)
{
  if (a1)
  {
    [a1 setHTTPCookieAcceptPolicy:1];
    [a1 setHTTPShouldSetCookies:0];
    [a1 setHTTPShouldUsePipelining:1];
    [a1 setRequestCachePolicy:1];
    objc_msgSend(a1, "set_timingDataOptions:", 69);
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"Accept-Language"));
    objc_msgSend(a1, "set_suppressedAutoAddedHTTPHeaders:", v2);
  }

void sub_10031C84C(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (!a1) {
    goto LABEL_29;
  }
  if (v3)
  {
    id v6 = objc_getProperty(v3, v4, 144LL, 1);
    objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v6);

    id Property = objc_getProperty(v5, v7, 80LL, 1);
  }

  else
  {
    objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", 0);
    id Property = 0LL;
  }

  id v9 = Property;
  objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:", v9);

  if (v5)
  {
    if ((*((_BYTE *)v5 + 13) & 1) != 0)
    {
      os_signpost_id_t v32 = @"NSAllowsArbitraryLoads";
      uint64_t v33 = &__kCFBooleanFalse;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      id v27 = 0LL;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  200LL,  0LL,  &v27));
      id v12 = v27;

      if (v11)
      {
        objc_msgSend(a1, "set_atsContext:", v11);
      }

      else
      {
        uint64_t v13 = ASDLogHandleForCategory(10LL);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v26 = objc_getProperty(v5, v15, 128LL, 1);
          *(_DWORD *)buf = 138412546;
          id v29 = v26;
          __int16 v30 = 2114;
          id v31 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[%@] Failed to encode ATS data error: %{public}@",  buf,  0x16u);
        }
      }
    }

    objc_msgSend(a1, "set_requiresPowerPluggedIn:", *((_BYTE *)v5 + 15) & 1);
    [a1 setAllowsCellularAccess:*((_BYTE *)v5 + 9) & 1];
    [a1 setAllowsConstrainedNetworkAccess:*((_BYTE *)v5 + 10) & 1];
    [a1 setAllowsExpensiveNetworkAccess:*((_BYTE *)v5 + 11) & 1];
    if (*((void *)v5 + 9) > 2uLL) {
      goto LABEL_15;
    }
    BOOL v17 = (*((void *)v5 + 9) & 7LL) == 2;
    uint64_t v18 = *((void *)v5 + 9) & 1LL;
  }

  else
  {
    objc_msgSend(a1, "set_requiresPowerPluggedIn:", 0);
    [a1 setAllowsCellularAccess:0];
    [a1 setAllowsConstrainedNetworkAccess:0];
    [a1 setAllowsExpensiveNetworkAccess:0];
    BOOL v17 = 0LL;
    uint64_t v18 = 0LL;
  }

  [a1 setDiscretionary:v17];
  objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:", v18);
  if (v5)
  {
LABEL_15:
    id v19 = objc_getProperty(v5, v16, 152LL, 1);
    goto LABEL_16;
  }

  id v19 = 0LL;
LABEL_16:
  id v20 = v19;

  if (v20)
  {
    if (v5) {
      id v22 = objc_getProperty(v5, v21, 152LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    id v23 = v22;
    [a1 setProtocolClasses:v23];
  }

  if (v5 && *((void *)v5 + 7))
  {
    objc_opt_self(&OBJC_CLASS___NSURLSessionConfiguration);
    if (qword_100462850 != -1) {
      dispatch_once(&qword_100462850, &stru_1003F3380);
    }
    uint64_t v24 = *((void *)v5 + 7);
    if (v24 == 1)
    {
      id v25 = @"com.apple.appstored.connectionPool.apps";
      goto LABEL_28;
    }

    if (v24 == 2)
    {
      id v25 = @"com.apple.appstored.connectionPool.odr";
LABEL_28:
      objc_msgSend(a1, "set_connectionPoolName:", v25);
    }
  }

id sub_10031CBC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  sub_10031C7BC(v4);
  sub_10031C84C(v4, v3);

  objc_msgSend(v4, "set_connectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v4, "set_longLivedConnectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v4, "set_preventsIdleSleepOnceConnected:", 1);
  return v4;
}

id sub_10031CC40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_self(a1);
  id v5 = sub_10031CC84(v4, v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

id sub_10031CC84(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  @"com.apple.appstored"));
  if (v3) {
    id Property = objc_getProperty(v3, v4, 144LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;

  if (v7)
  {
    if (v3) {
      id v9 = objc_getProperty(v3, v8, 144LL, 1);
    }
    else {
      id v9 = 0LL;
    }
    id v10 = v9;
    [v5 addObject:v10];
  }

  if (v3) {
    id v11 = objc_getProperty(v3, v8, 80LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  id v12 = v11;

  if (v12)
  {
    if (v3) {
      id v14 = objc_getProperty(v3, v13, 80LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    id v15 = v14;
    [v5 addObject:v15];
  }

  if (!v3)
  {
    [v5 addObject:@"inexpensive"];
    [v5 addObject:@"wifi"];
    [v5 addObject:@"nolowdata"];
LABEL_33:
    [v5 addObject:@"utility"];
    goto LABEL_34;
  }

  if ((*((_BYTE *)v3 + 13) & 1) != 0) {
    [v5 addObject:@"ats"];
  }
  uint64_t v16 = *((void *)v3 + 9);
  if (v16 == 2)
  {
    BOOL v17 = @"discretionary-always";
  }

  else
  {
    if (v16 != 1) {
      goto LABEL_21;
    }
    BOOL v17 = @"discretionary-inferred";
  }

  [v5 addObject:v17];
LABEL_21:
  if ((*((_BYTE *)v3 + 11) & 1) == 0) {
    [v5 addObject:@"inexpensive"];
  }
  if ((*((_BYTE *)v3 + 9) & 1) != 0)
  {
    if ((*((_BYTE *)v3 + 12) & 1) != 0) {
      goto LABEL_28;
    }
    uint64_t v18 = @"phone";
  }

  else
  {
    uint64_t v18 = @"wifi";
  }

  [v5 addObject:v18];
LABEL_28:
  if ((*((_BYTE *)v3 + 10) & 1) == 0) {
    [v5 addObject:@"nolowdata"];
  }
  if ((*((_BYTE *)v3 + 15) & 1) != 0) {
    [v5 addObject:@"power"];
  }
  if (*((_DWORD *)v3 + 4) <= 0x11u) {
    goto LABEL_33;
  }
LABEL_34:
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@"."]);

  return v19;
}

void sub_10031CEC8(id a1)
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  uint64_t v1 = (void *)qword_100462858;
  uint64_t v12 = qword_100462858;
  if (!qword_100462858)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    void v8[2] = sub_10031D098;
    v8[3] = &unk_1003ECDF8;
    void v8[4] = &v9;
    sub_10031D098((uint64_t)v8);
    uint64_t v1 = (void *)v10[3];
  }

  id v2 = v1;
  _Block_object_dispose(&v9, 8);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharedScheduler]);
  id v4 = [sub_10031CFE4() groupWithName:@"com.apple.appstored.connectionPool.apps" maxConcurrent:4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 createActivityGroup:v5];

  id v6 = [sub_10031CFE4() groupWithName:@"com.apple.appstored.connectionPool.odr" maxConcurrent:3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 createActivityGroup:v7];
}

void sub_10031CFCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10031CFE4()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_100462868;
  uint64_t v7 = qword_100462868;
  if (!qword_100462868)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    _DWORD v3[2] = sub_10031D1C0;
    v3[3] = &unk_1003ECDF8;
    v3[4] = &v4;
    sub_10031D1C0((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10031D080( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10031D098(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("_DASScheduler");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100462858 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    abort_report_np("Unable to find class %s", "_DASScheduler");
    sub_10031D104();
  }

void sub_10031D104()
{
  id v1 = 0LL;
  if (!qword_100462860)
  {
    __int128 v2 = off_1003F33A0;
    uint64_t v3 = 0LL;
    qword_100462860 = _sl_dlopen(&v2, &v1);
    v0 = v1;
    if (qword_100462860)
    {
      if (!v1) {
        return;
      }
    }

    else
    {
      v0 = (char *)abort_report_np("%s", v1);
    }

    free(v0);
  }

Class sub_10031D1C0(uint64_t a1)
{
  Class result = objc_getClass("_DASActivityGroup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100462868 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = (ConcatenateEnumerator *)abort_report_np("Unable to find class %s", "_DASActivityGroup");
    return (Class)-[ConcatenateEnumerator nextObject](v3, v4);
  }

  return result;
}

void sub_10031D48C(void *a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v15 = 0;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = a1;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = objc_autoreleasePoolPush();
        v3[2](v3, v9, &v15);
        objc_autoreleasePoolPop(v10);
        if (v15) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

id sub_10031D5B8(id a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v5 = a1;
    id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = v3[2](v3, *(void *)(*((void *)&v21 + 1) + 8LL * (void)v9));
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              char v15 = 0LL;
              do
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v4 addObject:*(void *)(*((void *)&v17 + 1) + 8 * (void)v15)];
                char v15 = (char *)v15 + 1;
              }

              while (v13 != v15);
              id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }

            while (v13);
          }

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v9 != v7);
        id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v7);
    }

    a1 = [v4 copy];
  }

  return a1;
}

id sub_10031D77C(id a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = a1;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = v3[2](v3, *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9));
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          if (v11) {
            objc_msgSend(v4, "addObject:", v11, (void)v13);
          }

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    a1 = [v4 copy];
  }

  return a1;
}

TransformEnumerator *sub_10031D8C8(void *a1, void *a2)
{
  if (!a1) {
    return (TransformEnumerator *)0LL;
  }
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___TransformEnumerator);
  id v5 = a1;
  id v6 = v3;
  if (v4)
  {
    v11.receiver = v4;
    v11.super_class = (Class)&OBJC_CLASS___TransformEnumerator;
    id v7 = (TransformEnumerator *)objc_msgSendSuper2(&v11, "init");
    id v4 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_enumerator, a1);
      id v8 = [v6 copy];
      id transform = v4->_transform;
      v4->_id transform = v8;
    }
  }

  return v4;
}

FilterEnumerator *sub_10031D99C(void *a1, void *a2)
{
  if (!a1) {
    return (FilterEnumerator *)0LL;
  }
  id v4 = a2;
  id v5 = objc_alloc(&OBJC_CLASS___FilterEnumerator);
  id v6 = a1;
  id v7 = v4;
  if (v5)
  {
    v10.receiver = v5;
    v10.super_class = (Class)&OBJC_CLASS___FilterEnumerator;
    id v8 = (FilterEnumerator *)objc_msgSendSuper2(&v10, "init");
    id v5 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_enumerator, a1);
      objc_storeStrong((id *)&v5->_predicate, a2);
    }
  }

  return v5;
}

id sub_10031DA6C(uint64_t a1)
{
  v2[0] = @"bundle_id";
  v2[1] = @"coordinator_id";
  v2[2] = @"external_id";
  v2[3] = @"item_id";
  v2[4] = @"log_code";
  v2[5] = @"IFNULL(app_install.priority, 0)";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v2,  6LL));
}

id sub_10031DB1C(id a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)&OBJC_CLASS___AppInstallInfo;
    a1 = objc_msgSendSuper2(&v20, "init");
    if (a1)
    {
      *((void *)a1 + _Block_object_dispose(va, 8) = [v5 longLongValue];
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundle_id"]);
      id v8 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v7;

      uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"coordinator_id"]);
      objc_super v10 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v9;

      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"external_id"]);
      id v12 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v11;

      __int128 v13 = (void *)*((void *)a1 + 7);
      if (v13)
      {
        v21[0] = 0LL;
        v21[1] = 0LL;
        [v13 getUUIDBytes:v21];
        uint64_t v14 = v21[0];
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      *((void *)a1 + 13) = v14;
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"item_id"]);
      __int128 v16 = (void *)*((void *)a1 + 9);
      *((void *)a1 + 9) = v15;

      __int128 v17 = -[LogKey initWithAppInstallDictionary:]( objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey),  "initWithAppInstallDictionary:",  v6);
      __int128 v18 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v17;

      *((_DWORD *)a1 + 2) = 0;
    }
  }

  return a1;
}

void sub_10031DCC4(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_self(a1);
  os_unfair_lock_lock(&stru_100463380);
  id v3 = (void *)qword_100463378;
  if (!qword_100463378)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    id v5 = (void *)qword_100463378;
    qword_100463378 = v4;

    id v3 = (void *)qword_100463378;
  }

  if (v8) {
    uint64_t v6 = v8[8];
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v6));
  [v3 setObject:v8 forKey:v7];

  os_unfair_lock_unlock(&stru_100463380);
}

void sub_10031DD7C(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  objc_opt_self(a1);
  os_unfair_lock_lock(&stru_100463380);
  id v3 = (void *)qword_100463378;
  if (qword_100463378)
  {
    if (v6) {
      uint64_t v4 = v6[8];
    }
    else {
      uint64_t v4 = 0LL;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v4));
    [v3 removeObjectForKey:v5];
  }

  os_unfair_lock_unlock(&stru_100463380);
}

id sub_10031DE10(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  os_unfair_lock_lock(&stru_100463380);
  if (qword_100463378) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100463378 objectForKey:v3]);
  }
  else {
    uint64_t v4 = 0LL;
  }
  os_unfair_lock_unlock(&stru_100463380);

  return v4;
}

void sub_10031DF0C(void *a1, uint64_t a2, void *a3)
{
  id v25 = a1;
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    [v25 bindArray:v5 atPosition:a2];
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      [v25 bindDictionary:v5 atPosition:a2];
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
      if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
      {
        [v25 bindString:v5 atPosition:a2];
      }

      else if (v5 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNull, v12), (objc_opt_isKindOfClass(v5, v13) & 1) == 0))
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate, v14);
        if ((objc_opt_isKindOfClass(v5, v15) & 1) != 0)
        {
          [v5 timeIntervalSinceReferenceDate];
        }

        else
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData, v16);
          if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
          {
            [v25 bindData:v5 atPosition:a2];
            goto LABEL_10;
          }

          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSUUID, v18);
          if ((objc_opt_isKindOfClass(v5, v19) & 1) != 0)
          {
            [v25 bindUUID:v5 atPosition:a2];
            goto LABEL_10;
          }

          uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSURL, v20);
          if ((objc_opt_isKindOfClass(v5, v21) & 1) != 0)
          {
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
            [v25 bindString:v22 atPosition:a2];

            goto LABEL_10;
          }

          id v23 = v5;
          __int128 v24 = (const char *)[v23 objCType];
          if (strcmp(v24, "d") && strcmp(v24, "f"))
          {
            objc_msgSend(v25, "bindInt64:atPosition:", objc_msgSend(v23, "longLongValue"), a2);
            goto LABEL_10;
          }

          [v23 doubleValue];
        }

        objc_msgSend(v25, "bindDouble:atPosition:", a2);
      }

      else
      {
        [v25 bindNullAtPosition:a2];
      }
    }
  }

__CFString *sub_10031E148(uint64_t a1)
{
  if (!a1) {
    return &stru_1003F3E40;
  }
  __int128 v2 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 3 * a1 + 1);
  -[NSMutableString appendString:](v2, "appendString:", @"?");
  uint64_t v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      -[NSMutableString appendString:](v2, "appendString:", @", ?");
      --v3;
    }

    while (v3);
  }

  id v4 = -[NSMutableString copy](v2, "copy");

  return (__CFString *)v4;
}

void *sub_10031E1DC(void *a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
    id v4 = 0LL;
    goto LABEL_9;
  }

  if ((sub_10031E2C8((uint64_t)&OBJC_CLASS___AnonymousPingTask) & 1) == 0)
  {
    uint64_t v6 = ASDLogHandleForCategory(25LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Dropping anonymous pings - DNU submission disabled",  buf,  2u);
    }

    id v4 = 0LL;
    goto LABEL_8;
  }

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS___AnonymousPingTask;
  id v4 = objc_msgSendSuper2(&v9, "init");
  if (v4)
  {
    id v5 = [v3 copy];
    a1 = (void *)v4[5];
    void v4[5] = v5;
LABEL_8:
  }

uint64_t sub_10031E2C8(uint64_t a1)
{
  id v1 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = [v2 isHRNMode] ^ 1;

  return v3;
}

id sub_10031E760(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.itunes.extended-media-kind" stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"]);
  __int128 v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", &off_10040D3F0);
  -[NSMutableArray addObject:](v2, "addObject:", &off_10040D408);
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (-[NSMutableArray count](v2, "count"))
  {
    unint64_t v4 = 0LL;
    do
    {
      if (v4) {
        -[NSMutableString appendString:](v3, "appendString:", @",");
      }
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", v4));
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"'%@:%llu'",  v1,  [v5 unsignedLongLongValue]);

      ++v4;
    }

    while (v4 < (unint64_t)-[NSMutableArray count](v2, "count"));
  }

  uint64_t v6 = ASDLogHandleForCategory(8LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Query string for DAAP call is: %{public}@",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3));
  return v8;
}

void sub_10031EBD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10031EBF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = ASDLogHandleForCategory(14LL);
    unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Completed request %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    id v6 = sub_1001BA92C(WeakRetained);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = *(void **)(a1 + 40);
    if (v8) {
      uint64_t v8 = (void *)v8[2];
    }
    objc_super v9 = v8;
    [v9 receiveResponse:v7];
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0LL);
  }
}

id *sub_10031EDD4(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_CLASS___ProgressInfo;
    uint64_t v10 = (id *)objc_msgSendSuper2(&v23, "init");
    a1 = v10;
    if (v10)
    {
      v10[12] = v7;
      objc_storeStrong(v10 + 13, a4);
      if (v8) {
        id v11 = v8;
      }
      else {
        sub_10027375C(objc_alloc(&OBJC_CLASS___ProgressPortions), 0LL, 0LL);
      }
      id v12 = a1[17];
      a1[17] = v11;

      a1[16] = 0LL;
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 50LL));
      id v14 = a1[5];
      a1[5] = (id)v13;

      uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 30LL));
      id v16 = a1[7];
      a1[7] = (id)v15;

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      a1[1] = v17;
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      a1[2] = v18;
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      a1[3] = v19;
      uint64_t v20 = objc_alloc_init(&OBJC_CLASS___ASDProgress);
      id v21 = a1[9];
      a1[9] = v20;

      [a1[9] setBundleID:v7];
      [a1[9] setCompletedUnitCount:-1];
      [a1[9] setTotalUnitCount:1000];
      [a1[9] setInstallTotalUnitCount:1000];
      [a1[9] setPhase:1];
    }
  }

  return a1;
}

id *sub_10031EF5C(id *result)
{
  if (result)
  {
    id v1 = result;
    [result[5] removeAllObjects];
    [v1[7] removeAllObjects];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v1[1] = v2;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v1[2] = v3;
    Class result = (id *)+[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v1[3] = v4;
  }

  return result;
}

id *sub_10031EFB4(id *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    if ([result[9] phase] == (id)2)
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      double v3 = sub_10031F2D0(v1, *(void *)(v1 + 112), v2);
      double v4 = v3;
      if (v3 > 0.0)
      {
        uint64_t v5 = *(void **)(v1 + 56);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
        [v5 addObject:v6];

        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v7 = *(id *)(v1 + 56);
        id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        double v9 = 0.0;
        double v10 = 0.0;
        if (v8)
        {
          id v11 = v8;
          uint64_t v12 = *(void *)v24;
          do
          {
            uint64_t v13 = 0LL;
            do
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v7);
              }
              objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v13), "doubleValue", (void)v23);
              double v10 = v10 + v14;
              uint64_t v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v11 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }

          while (v11);
        }

        if ([*(id *)(v1 + 56) count]) {
          double v9 = (double)(uint64_t)ceil( (double)(unint64_t)(*(void *)(v1 + 120) - *(void *)(v1 + 112))
        }
                                / (double)(uint64_t)ceil( v10 / (double)(unint64_t)[*(id *)(v1 + 56) count]));
        double v15 = *(double *)(v1 + 24);
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate", (void)v23);
        double v17 = v15 - (double)(uint64_t)ceil(v16 - *(double *)(v1 + 16));
        if (vabdd_f64(v17, v9) / v17 > 0.25)
        {
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          *(void *)(v1 + 16) = v18;
          *(double *)(v1 + 24) = v9;
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          double v17 = v9 - (double)(uint64_t)ceil(v19 - *(double *)(v1 + 16));
        }

        uint64_t v20 = (uint64_t)v17;
        goto LABEL_23;
      }
    }

    else
    {
      if ([*(id *)(v1 + 72) phase] != (id)5)
      {
        sub_10031EF5C((id *)v1);
        uint64_t v20 = -1LL;
        double v4 = 0.0;
LABEL_23:
        Class result = (id *)objc_msgSend( *(id *)(v1 + 72),  "setCompletedUnitCount:",  (uint64_t)(*(double *)(v1 + 128)
                                 * (double)(uint64_t)[*(id *)(v1 + 72) totalUnitCount]));
        if (v4 > 0.0)
        {
          [*(id *)(v1 + 72) setThroughput:v4];
          return (id *)_[*(id *)(v1 + 72) setSecondsRemaining:v20];
        }

        return result;
      }

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      double v22 = sub_10031F2D0(v1, *(void *)(v1 + 80), v21);
      double v4 = v22;
      if (v22 > 0.0)
      {
        uint64_t v20 = vcvtpd_s64_f64((double)(unint64_t)(*(void *)(v1 + 88) - *(void *)(v1 + 80)) / v22);
        goto LABEL_23;
      }
    }

    uint64_t v20 = -1LL;
    goto LABEL_23;
  }

  return result;
}

double sub_10031F2D0(uint64_t a1, unint64_t a2, double a3)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___ProgressSample);
  id v7 = v6;
  if (v6)
  {
    v6->_time = a3;
    v6->_bytes = a2;
  }

  [*(id *)(a1 + 40) addObject:v6];
  double v8 = 0.0;
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 5)
  {
    double v9 = (double)(unint64_t)[*(id *)(a1 + 40) count];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = *(id *)(a1 + 40);
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      double v14 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          unint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v18);
          if (v19)
          {
            double v20 = *(double *)(v19 + 16) - *(double *)(a1 + 8);
            unint64_t v19 = *(void *)(v19 + 8);
          }

          else
          {
            double v20 = 0.0 - *(double *)(a1 + 8);
          }

          double v17 = v17 + v20;
          double v14 = v14 + v20 * v20;
          double v15 = v15 + v20 * (double)v19;
          double v16 = v16 + (double)v19;
          uint64_t v18 = (char *)v18 + 1;
        }

        while (v12 != v18);
        id v21 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        id v12 = v21;
      }

      while (v21);
    }

    else
    {
      double v14 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
    }

    double v8 = (v9 * v15 - v17 * v16) / (v9 * v14 - v17 * v17);
  }

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count", (void)v24) >= 0x32)
  {
    unint64_t v22 = 0LL;
    do
      [*(id *)(a1 + 40) removeObjectAtIndex:v22++];
    while (v22 < (unint64_t)[*(id *)(a1 + 40) count]);
  }

  return v8;
}

void *sub_10031F4D8(void *result, unint64_t a2)
{
  if (result)
  {
    double v2 = result;
    result[14] = a2;
    uint64_t v3 = result[17];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      if (v4 < 1) {
        double v5 = (double)(unint64_t)result[15];
      }
      else {
        double v5 = (double)(v4 + result[15]);
      }
      double v6 = (double)a2 / v5;
      double v7 = *(double *)(v3 + 16);
    }

    else
    {
      double v6 = (double)a2 / (double)(unint64_t)result[15];
      double v7 = 0.0;
    }

    *((double *)result + 16) = v6 * (1.0 - v7);
    uint64_t v8 = ASDLogHandleForCategory(24LL);
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = v2[16];
      uint64_t v11 = v2[13];
      uint64_t v12 = v2[14];
      int v14 = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[%@]: Received download update: %.2f (%lld)",  (uint8_t *)&v14,  0x20u);
    }

    [(id)v2[9] setDownloadCompletedUnitCount:v2[14]];
    [(id)v2[9] setDownloadTotalUnitCount:v2[15]];
    if (v2[14] < v2[15]) {
      uint64_t v13 = 2LL;
    }
    else {
      uint64_t v13 = 3LL;
    }
    return [(id)v2[9] setPhase:v13];
  }

  return result;
}

void sub_10031F7E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      double v6 = *(void **)(a1 + 8);
      *(void *)(a1 + _Block_object_dispose(va, 8) = v5;

      uint64_t v4 = *(void **)(a1 + 8);
    }

    [v4 addObject:v7];
    id v3 = v7;
  }
}

void sub_10031FE08(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_11;
  }
  unsigned int v7 = +[UpdatesManager shouldUseModernUpdates](&OBJC_CLASS___UpdatesManager, "shouldUseModernUpdates");
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"update_state",  &off_10040D468,  2LL));
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"update_state",  &off_10040D468,  2LL));
  v26[0] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_offloaded",  &__kCFBooleanFalse));
  v26[1] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_per_device",  &__kCFBooleanFalse));
  void v26[2] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v12));

  if (v5)
  {
LABEL_6:
    v25[0] = v8;
    v25[1] = v5;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v13));

    uint64_t v8 = (void *)v14;
  }

id sub_1003200F0(id a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  @"update_state",  &off_10040E098));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v3));

    v13[0] = v4;
    v13[1] = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));

    if (+[UpdatesManager shouldUseModernUpdates](&OBJC_CLASS___UpdatesManager, "shouldUseModernUpdates")) {
      uint64_t v8 = &OBJC_CLASS____TtC9appstored14MediaAPIUpdate;
    }
    else {
      uint64_t v8 = &OBJC_CLASS___AppUpdateMemoryEntity;
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v2 connection]);
    id v10 = sub_10024CAA4((uint64_t)v8, v9, v7);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    id v2 = (id)objc_claimAutoreleasedReturnValue([v11 buyParams]);
  }

  return v2;
}

id sub_100320260(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000LL;
    id v10 = sub_10032036C;
    uint64_t v11 = sub_10032037C;
    id v12 = 0LL;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"bundle_id",  v3));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_100320384;
    v6[3] = &unk_1003F3428;
    void v6[4] = &v7;
    sub_10031FE08(a1, v4, v6);
    a1 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }

  return a1;
}

void sub_100320354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10032036C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10032037C(uint64_t a1)
{
}

void sub_100320384(uint64_t a1, void *a2)
{
}

id sub_100320394(id a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MediaAPIUpdateEntity bundleIDPropertyKey]( &OBJC_CLASS____TtC9appstored20MediaAPIUpdateEntity,  "bundleIDPropertyKey"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  v4,  v3));

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 connection]);
    id v7 = sub_10024CAA4((uint64_t)&OBJC_CLASS____TtC9appstored14MediaAPIUpdate, v6, v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MediaAPIUpdateEntity metadataPropertyKey]( &OBJC_CLASS____TtC9appstored20MediaAPIUpdateEntity,  "metadataPropertyKey"));
    id v2 = (id)objc_claimAutoreleasedReturnValue([v8 valueForProperty:v9]);
  }

  return v2;
}

void sub_100320474(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(_BYTE *)(a1 + 40))
  {
    id v6 = sub_1001E26D0(v3, (uint64_t)@"bundle_id");
    id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"store_item_data"]);
    uint64_t v9 = (void *)v7;
    if (v5) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
      char isKindOfClass = objc_opt_isKindOfClass(v9, v16);
      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v18 = -[AppUpdateMemoryEntity initWithUpdateDictionary:]( objc_alloc(&OBJC_CLASS___AppUpdateMemoryEntity),  "initWithUpdateDictionary:",  v9);
        if (v18)
        {
          id v19 = v18;
          (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        }
      }

      goto LABEL_18;
    }

    uint64_t v11 = ASDLogHandleForCategory(40LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v13)
      {
        __int16 v20 = 0;
        uint64_t v14 = "No bundleID";
        uint64_t v15 = (uint8_t *)&v20;
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v14, v15, 2u);
      }
    }

    else if (v13)
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "Bad item data";
      uint64_t v15 = buf;
      goto LABEL_21;
    }

LABEL_18:
    goto LABEL_19;
  }

  id v5 = v3;
  if (([v5 isOffloaded] & 1) == 0
    && ([v5 isPerDevice] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

id sub_100320738(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003207B0;
  block[3] = &unk_1003E9EA8;
  void block[4] = objc_opt_self(a1);
  if (qword_100462878 != -1) {
    dispatch_once(&qword_100462878, block);
  }
  return (id)qword_100462870;
}

void sub_1003207B0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100462870;
  qword_100462870 = (uint64_t)v1;
}

BOOL sub_1003207D4(uint64_t a1, void *a2, int a3, int a4, BOOL *a5, void *a6)
{
  id v11 = a2;
  uint64_t v58 = a1;
  if (!a1)
  {
    BOOL v48 = 0LL;
    goto LABEL_44;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

  id v59 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_DSID"));
  id v15 = sub_1002C1294((uint64_t)&OBJC_CLASS___FamilyInfoLookupTask, v11);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  BOOL v18 = v16 != 0;
  if (v16)
  {
    unint64_t v19 = (unint64_t)*(id *)(v16 + 16);
    if (a3)
    {
LABEL_4:
      id v64 = 0LL;
      sub_100320C78(v58, a4 ^ 1, v11, &v64);
      [*(id *)(v58 + 48) lock];
      __int16 v20 = (void *)v19;
      unint64_t v19 = (unint64_t)[*(id *)(v58 + 32) copy];
      [*(id *)(v58 + 48) unlock];
      id v21 = v64;

      BOOL v18 = (v17 | v19) != 0;
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v22 = ASDLogHandleForCategory(14LL);
    char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v25 = (void *)objc_opt_class(v58, v24);
      id v54 = v25;
      char v56 = a6;
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "ams_DSID"));
      *(_DWORD *)buf = 138543874;
      id v67 = v25;
      __int16 v68 = 2114;
      id v69 = v11;
      __int16 v70 = 2114;
      id v71 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Did not find cached FamilyInfo for account: %{public}@",  buf,  0x20u);

      a6 = v56;
    }

    unint64_t v19 = 0LL;
    if (a3) {
      goto LABEL_4;
    }
  }

  id v21 = 0LL;
LABEL_9:
  if (v19) {
    BOOL v27 = v21 == 0LL;
  }
  else {
    BOOL v27 = 0;
  }
  if (!v27 || v14 == 0LL)
  {
    BOOL v29 = 0;
    if (!a6) {
      goto LABEL_41;
    }
  }

  else
  {
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    unint64_t v55 = v19;
    uint64_t v57 = a6;
    id v53 = v21;
    if (v17) {
      __int16 v30 = *(void **)(v17 + 16);
    }
    else {
      __int16 v30 = 0LL;
    }
    id v31 = v30;
    id v32 = [v31 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v32)
    {
      id v33 = v32;
      BOOL v50 = v18;
      uint64_t v51 = a5;
      id v52 = v11;
      uint64_t v34 = *(void *)v61;
LABEL_23:
      uint64_t v35 = 0LL;
      while (1)
      {
        if (*(void *)v61 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v60 + 1) + 8 * v35);
        if (v36)
        {
          id v37 = *(id *)(v36 + 40);
          if (v37)
          {
            uint64_t v38 = v37;
            id v39 = *(id *)(v36 + 40);
            unsigned int v40 = [v39 isEqualToNumber:v14];

            if (v40) {
              break;
            }
          }
        }

        if (v33 == (id)++v35)
        {
          id v41 = [v31 countByEnumeratingWithState:&v60 objects:v74 count:16];
          id v33 = v41;
          if (!v41)
          {
            BOOL v29 = 0;
            id v11 = v52;
            goto LABEL_37;
          }

          goto LABEL_23;
        }
      }

      int v42 = *(unsigned __int8 *)(v36 + 9);
      BOOL v29 = *(_BYTE *)(v36 + 9) != 0;
      uint64_t v43 = ASDLogHandleForCategory(14LL);
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      id v11 = v52;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = (void *)objc_opt_class(v58, v45);
        *(_DWORD *)buf = 138544130;
        id v67 = v46;
        __int16 v68 = 2114;
        id v69 = v52;
        __int16 v70 = 2114;
        id v71 = v14;
        __int16 v72 = 1024;
        int v73 = v42;
        id v47 = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Family member found for account: %{public}@ askToBuyEnabled: %d",  buf,  0x26u);
      }

LABEL_37:
      a5 = v51;
      a6 = v57;
      BOOL v18 = v50;
    }

    else
    {
      BOOL v29 = 0;
    }

    id v21 = v53;
    unint64_t v19 = v55;
    if (!a6) {
      goto LABEL_41;
    }
  }

  *a6 = v21;
LABEL_41:
  if (a5) {
    *a5 = v18;
  }
  BOOL v65 = v29;

  BOOL v48 = v65;
LABEL_44:

  return v48;
}

id sub_100320BDC(void *a1)
{
  if (a1)
  {
    id v1 = sub_100320BFC((uint64_t)a1, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue(v1);
  }

  return a1;
}

id sub_100320BFC(uint64_t a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    sub_100320C78(a1, a2, v4, 0LL);
    [*(id *)(a1 + 48) lock];
    id v5 = [*(id *)(a1 + 24) copy];
    [*(id *)(a1 + 48) unlock];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void sub_100320C78(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  if (*(double *)(a1 + 40) > 0.0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    if (v10 >= -10800.0)
    {
      id v23 = 0LL;
      goto LABEL_51;
    }
  }

  uint64_t v11 = ASDLogHandleForCategory(14LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v72 = (id)objc_opt_class(a1, v13);
    __int16 v73 = 2114;
    id v74 = v7;
    __int16 v75 = 1024;
    LODWORD(v76) = 1;
    id v14 = v72;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Bootstrapping family : refresh from server: %d",  buf,  0x1Cu);
  }

  id v15 = objc_alloc(&OBJC_CLASS___FamilyInfoLookupTask);
  id v16 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = sub_1002C1218((id *)v15, v17);

  if (v18)
  {
    objc_setProperty_nonatomic_copy(v18, v19, v7, 16LL);
    *((_BYTE *)v18 + _Block_object_dispose(va, 8) = a2;
  }

  __int16 v20 = sub_1002C18B0(v18);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v69 = 0LL;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 resultWithError:&v69]);
  id v23 = v69;

  if (!v23)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    *(void *)(a1 + 40) = v29;
    if (v22) {
      __int16 v30 = (void *)v22[2];
    }
    else {
      __int16 v30 = 0LL;
    }
    id v31 = v30;

    if (!v31) {
      goto LABEL_47;
    }
    [*(id *)(a1 + 48) lock];
    __int128 v62 = a4;
    id v63 = v7;
    __int128 v60 = v18;
    id v59 = v22;
    if (v22) {
      id v32 = (void *)v22[2];
    }
    else {
      id v32 = 0LL;
    }
    id v33 = v32;
    id v34 = [v33 copy];
    uint64_t v35 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v34;

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "ams_DSID"));

    id v64 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    uint64_t v61 = a1;
    id v37 = *(id *)(a1 + 32);
    id v38 = [v37 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (!v38)
    {
LABEL_41:

      id v50 = -[NSMutableArray copy](v64, "copy");
      uint64_t v51 = *(void **)(v61 + 24);
      *(void *)(v61 + 24) = v50;

      [*(id *)(v61 + 48) unlock];
      a4 = v62;
      id v7 = v63;
      BOOL v18 = v60;
      uint64_t v22 = v59;
      if ([*(id *)(v61 + 24) count])
      {
        uint64_t v52 = ASDLogHandleForCategory(14LL);
        id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v55 = (void *)objc_opt_class(v61, v54);
          char v56 = *(void **)(v61 + 24);
          id v57 = v55;
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "componentsJoinedByString:", @", "));
          *(_DWORD *)buf = 138543874;
          id v72 = v55;
          __int16 v73 = 2114;
          id v74 = v63;
          __int16 v75 = 2114;
          id v76 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Set family accounts to: [%{public}@]",  buf,  0x20u);
        }
      }

      id v23 = 0LL;
      goto LABEL_46;
    }

    id v39 = v38;
    uint64_t v40 = *(void *)v66;
LABEL_17:
    uint64_t v41 = 0LL;
    while (1)
    {
      if (*(void *)v66 != v40) {
        objc_enumerationMutation(v37);
      }
      uint64_t v42 = *(void *)(*((void *)&v65 + 1) + 8 * v41);
      if (v25)
      {
        if (!v42) {
          goto LABEL_39;
        }
      }

      else
      {
        if (!v42)
        {
          id v23 = 0LL;
LABEL_39:
          id v43 = 0LL;
          goto LABEL_27;
        }

        id v48 = *(id *)(v42 + 40);
        id v23 = v48;
        if (v48)
        {

LABEL_34:
          id v45 = v23;
          id v23 = *(id *)(v42 + 40);
          -[NSMutableArray addObject:](v64, "addObject:", v23);
LABEL_35:

          id v23 = v45;
          goto LABEL_36;
        }
      }

      id v43 = *(id *)(v42 + 40);
      if (v43) {
        BOOL v44 = v25 == 0LL;
      }
      else {
        BOOL v44 = 1;
      }
      if (!v44)
      {
        id v46 = *(id *)(v42 + 40);
        unsigned __int8 v47 = [v46 isEqualToNumber:v25];

        if ((v47 & 1) != 0) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }

void sub_100321228(uint64_t a1)
{
  id v66 = (id)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "ams_DSID"));
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 8);
  if (v2)
  {
    if (!v5) {
      goto LABEL_7;
    }
  }

  else if (v5)
  {
    goto LABEL_7;
  }

  uint64_t v4 = *(void *)(a1 + 32);
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), v3);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (*(void *)(v6 + 32))
    {
      uint64_t v7 = ASDLogHandleForCategory(14LL);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v82 = (id)objc_opt_class(v6, v9);
        id v10 = v82;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared family", buf, 0xCu);
      }
    }

    [*(id *)(v6 + 48) lock];
    uint64_t v11 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0LL;
    *(void *)(v6 + 40) = 0LL;

    id v12 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0LL;

    [*(id *)(v6 + 48) unlock];
  }

  if (v66)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v66;
    id v15 = v14;
    if (!v13)
    {
LABEL_48:

      goto LABEL_49;
    }

    __int128 v67 = v14;
    id v16 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    uint64_t v17 = ASDLogHandleForCategory(14LL);
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = (void *)objc_opt_class(v13, v19);
      id v21 = v20;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "ams_DSID"));
      *(_DWORD *)buf = 138543874;
      id v82 = v20;
      __int16 v83 = 2114;
      unsigned int v84 = v16;
      __int16 v85 = 2114;
      id v86 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Checking if account: %{public}@ has FamilyInfo following account change",  buf,  0x20u);
    }

    uint64_t v64 = v13;

    id v23 = sub_1002C1294((uint64_t)&OBJC_CLASS___FamilyInfoLookupTask, v16);
    id v15 = v67;
    __int128 v65 = (id *)objc_claimAutoreleasedReturnValue(v23);
    if (v65)
    {
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      id v24 = v65[2];
      id v25 = [v24 countByEnumeratingWithState:&v69 objects:buf count:16];
      if (v25)
      {
        id v26 = v25;
        __int128 v62 = v16;
        id v63 = v3;
        char v27 = 0;
        uint64_t v28 = *(void *)v70;
        do
        {
          uint64_t v29 = 0LL;
          do
          {
            if (*(void *)v70 != v28) {
              objc_enumerationMutation(v24);
            }
            uint64_t v30 = *(void *)(*((void *)&v69 + 1) + 8LL * (void)v29);
            if (v30)
            {
              id v31 = *(id *)(v30 + 40);
              if (v31)
              {
                id v32 = v31;
                uint64_t v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_DSID"));
                if (v33)
                {
                  id v34 = (void *)v33;
                  id v35 = *(id *)(v30 + 40);
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_DSID"));
                  unsigned int v37 = [v35 isEqualToNumber:v36];

                  id v15 = v67;
                  if (v37) {
                    char v27 = 1;
                  }
                }

                else
                {
                }
              }
            }

            uint64_t v29 = (char *)v29 + 1;
          }

          while (v26 != v29);
          id v38 = [v24 countByEnumeratingWithState:&v69 objects:buf count:16];
          id v26 = v38;
        }

        while (v38);

        id v16 = v62;
        id v3 = v63;
        if ((v27 & 1) != 0)
        {
          uint64_t v39 = ASDLogHandleForCategory(14LL);
          id v40 = (id)objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
          {
LABEL_47:

            goto LABEL_48;
          }

          uint64_t v42 = (void *)objc_opt_class(v64, v41);
          id v43 = v42;
          BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "ams_DSID"));
          *(_DWORD *)__int16 v73 = 138543874;
          id v74 = v42;
          __int16 v75 = 2114;
          id v76 = v62;
          __int16 v77 = 2114;
          int v78 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v40,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] FamilyInfo found for account: %{public}@",  v73,  0x20u);

LABEL_46:
          id v15 = v67;
          goto LABEL_47;
        }
      }

      else
      {
      }
    }

    uint64_t v45 = ASDLogHandleForCategory(14LL);
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = (void *)objc_opt_class(v64, v47);
      id v49 = v48;
      id v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "ams_DSID"));
      *(_DWORD *)__int16 v73 = 138543874;
      id v74 = v48;
      __int16 v75 = 2114;
      id v76 = v16;
      __int16 v77 = 2114;
      int v78 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] FamilyInfo not found account: %{public}@. Attempting to reload silently.",  v73,  0x20u);
    }

    id v68 = 0LL;
    sub_100320C78(v64, 1, v16, &v68);
    id v40 = v68;
    uint64_t v51 = ASDLogHandleForCategory(14LL);
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    if (v40)
    {
      if (v53)
      {
        unint64_t v55 = (void *)objc_opt_class(v64, v54);
        id v56 = v55;
        id v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "ams_DSID"));
        *(_DWORD *)__int16 v73 = 138544130;
        id v74 = v55;
        __int16 v75 = 2114;
        id v76 = v16;
        __int16 v77 = 2114;
        int v78 = v57;
        __int16 v79 = 2114;
        id v80 = v40;
        uint64_t v58 = "[%{public}@] [%{public}@] Error looking up FamilyInfo for account: %{public}@ error: %{public}@";
        id v59 = v52;
        uint32_t v60 = 42;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, v58, v73, v60);
      }
    }

    else if (v53)
    {
      uint64_t v61 = (void *)objc_opt_class(v64, v54);
      id v56 = v61;
      id v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "ams_DSID"));
      *(_DWORD *)__int16 v73 = 138543874;
      id v74 = v61;
      __int16 v75 = 2114;
      id v76 = v16;
      __int16 v77 = 2114;
      int v78 = v57;
      uint64_t v58 = "[%{public}@] [%{public}@] FamilyInfo reloaded for account: %{public}@";
      id v59 = v52;
      uint32_t v60 = 32;
      goto LABEL_44;
    }

    goto LABEL_46;
  }

void sub_100321874(void *a1, void *a2)
{
  id v11 = a2;
  if (a1)
  {
    id v3 = sub_1001D7934(a1);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = (NSMutableDictionary *)[v4 mutableCopy];

    if (!v5) {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v6 = [v11 copy];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"AnalyticsDialogName");

    uint64_t v7 = v5;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 userInfo]);
    uint64_t v9 = (NSMutableDictionary *)[v8 mutableCopy];

    if (!v9) {
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v10 = -[NSMutableDictionary copy](v7, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v10,  @"com.apple.appstored.AnalyticsEvent");

    [a1 setUserInfo:v9];
  }
}

BOOL sub_100321978(id a1, NSString *a2, id a3)
{
  return AnalyticsSendEventLazy(a2, a3);
}

void sub_100321984(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (a1)
  {
    id v10 = sub_1001D7934(a1);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"AnalyticsDialogName"]);
      id v14 = v13;
      if (v13 && [v13 length])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        void v15[2] = sub_100321AB0;
        v15[3] = &unk_1003F34B8;
        id v16 = v12;
        id v17 = v7;
        BOOL v18 = a1;
        id v19 = v8;
        id v20 = v14;
        v9[2](v9, @"com.apple.appstored.dialog", v15);
      }
    }
  }
}

NSMutableDictionary *sub_100321AB0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"AnalyticsEventInfo"]);
  id v3 = (NSMutableDictionary *)[v2 mutableCopy];

  if (!v3) {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) selectedActionIdentifier]);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) locateActionWithIdentifier:v4]);
    id v6 = v5;
    if (v5)
    {
      id v7 = sub_1001D78E8(v5);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
      if (!v8)
      {
        unint64_t v9 = (unint64_t)[v6 style];
        if (v9 > 2) {
          id v8 = @"uknown";
        }
        else {
          id v8 = off_1003F34D8[v9];
        }
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"actionName");
    }
  }

  id v10 = *(void **)(a1 + 56);
  if (v10)
  {
    id v11 = sub_100298CBC(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"errorDescription");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 64),  @"dialogName");

  return v3;
}

id sub_100321BE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_opt_self(a1);
  id v6 = v5;
  objc_opt_self(&OBJC_CLASS___AppMetadataLoader);
  id v7 = objc_alloc(&OBJC_CLASS___AppMetadataLoader);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleContainerURL]);

  id v9 = v8;
  if (v7)
  {
    v18.receiver = v7;
    v18.super_class = (Class)&OBJC_CLASS___AppMetadataLoader;
    id v10 = (AppMetadataLoader *)objc_msgSendSuper2(&v18, "init");
    id v7 = v10;
    if (v10)
    {
      v10->_targetIsContainer = 1;
      objc_storeStrong((id *)&v10->_targetURL, v8);
    }
  }

  if (v7)
  {
    if (v7->_targetIsContainer)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( v7->_targetURL,  "URLByAppendingPathComponent:",  @"iTunesMetadata"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathExtension:@"plist"]);

      if (v12)
      {
        v18.receiver = 0LL;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MIStoreMetadata metadataFromPlistAtURL:error:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromPlistAtURL:error:",  v12,  &v18));
        id v14 = v18.receiver;
        if (!a3) {
          goto LABEL_15;
        }
      }

      else
      {
        id v14 = 0LL;
        uint64_t v13 = 0LL;
        if (!a3)
        {
LABEL_15:

          goto LABEL_16;
        }
      }

      if (!v13)
      {
        id v16 = sub_100321D90(v7->_targetURL, v14, @"Loading failed");
        *a3 = (id)objc_claimAutoreleasedReturnValue(v16);
      }

      goto LABEL_15;
    }

    if (a3)
    {
      id v15 = sub_100321D90(v7->_targetURL, 0LL, @"Extended attribute is not available on this platform");
      *a3 = (id)objc_claimAutoreleasedReturnValue(v15);
    }
  }

  uint64_t v13 = 0LL;
LABEL_16:

  return v13;
}

id sub_100321D90(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ for '%@'",  v5,  v7));

  uint64_t v9 = ASDErrorWithUnderlyingErrorAndDescription(v6, ASDErrorDomain, 513LL, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

id *sub_100321E68(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___CodeSignatureVersionRepair;
    a1 = (id *)objc_msgSendSuper2(&v10, "init");
    if (a1)
    {
      id v7 = [v5 copy];
      id v8 = a1[1];
      a1[1] = v7;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

void sub_100322208( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t sub_10032223C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10032224C(uint64_t a1)
{
}

void sub_100322254(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100322358;
  void v7[3] = &unk_1003F34F8;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  __int128 v8 = v6;
  [v2 updateAllWithOrder:v3 requestToken:v4 replyHandler:v7];
}

void sub_100322358(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v13 = v6;
  if (v6)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v8 = v6;
    uint64_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }

  else
  {
    if ([a3 count]) {
      goto LABEL_5;
    }
    uint64_t v10 = ASDErrorWithDescription(ASDErrorDomain, 916LL, @"No update found");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v9 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1003223F4(uint64_t a1, void *a2)
{
  id v3 = sub_100320260(a2, *(void **)(*(void *)(a1 + 32) + 8LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100322438(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100322540(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_self(a1);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"itms-apps://?action=lookup&ids=%@",  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v12 = 0LL;
  LODWORD(v7) = [v9 openURL:v8 withOptions:0 error:&v12];
  id v10 = v12;

  if ((_DWORD)v7) {
    id v11 = 0LL;
  }
  else {
    id v11 = v10;
  }
  ((void (**)(id, id))v5)[2](v5, v11);
}

void sub_100322630(uint64_t a1, void *a2)
{
  uint64_t v7 = a2;
  objc_opt_self(a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  unsigned int v4 = [v3 openApplicationWithBundleID:@"com.apple.TVAppStore"];

  if (v4)
  {
    v7[2](v7, 0LL);
  }

  else
  {
    uint64_t v5 = ASDErrorWithDescription(ASDErrorDomain, 1134LL, @"Open failed, but SPI doesn't provide an error");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    ((void (**)(id, void *))v7)[2](v7, v6);
  }
}

void *sub_100322838(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___DownloadSinf;
    a1 = objc_msgSendSuper2(&v7, "init");
    if (a1)
    {
      id v4 = [v3 copy];
      uint64_t v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

void sub_1003229A0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2)
    {
      id v3 = [*(id *)(v2 + 8) copy];
      if (v3)
      {
        id v31 = v3;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        uint64_t v4 = *(void *)(a1 + 16);
        if (v4) {
          id v5 = [*(id *)(v4 + 8) copy];
        }
        else {
          id v5 = 0LL;
        }
        id v6 = [v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v37;
          do
          {
            for (i = 0LL; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v37 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
              uint64_t v11 = ASDLogHandleForCategory(19LL);
              id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v42 = v10;
                _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Deleting asset pack at URL: %{public}@",  buf,  0xCu);
              }

              sub_1001AC35C((uint64_t)&OBJC_CLASS___ODRAssetPack, v10);
            }

            id v7 = [v5 countByEnumeratingWithState:&v36 objects:v43 count:16];
          }

          while (v7);
        }
      }

      else
      {
        id v31 = 0LL;
      }
    }

    else
    {
      id v31 = 0LL;
    }

    id v13 = *(id **)(a1 + 16);
    if (v13)
    {
      uint64_t v14 = (id *)[v13[2] copy];
      if (v14)
      {
        uint64_t v30 = v14;
        id v15 = sub_1002FE4E0((uint64_t)&OBJC_CLASS___ODRServiceDelegate);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
        id v17 = (void *)v16;
        if (v16) {
          objc_super v18 = *(void **)(v16 + 32);
        }
        else {
          objc_super v18 = 0LL;
        }
        id v19 = v18;

        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        uint64_t v21 = *(void *)(a1 + 16);
        if (v21) {
          id v22 = [*(id *)(v21 + 16) copy];
        }
        else {
          id v22 = 0LL;
        }
        id v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v33;
          do
          {
            for (j = 0LL; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v22);
              }
              char v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v19,  *(void *)(*((void *)&v32 + 1) + 8LL * (void)j)));
              if ([v20 fileExistsAtPath:v27])
              {
                uint64_t v28 = ASDLogHandleForCategory(19LL);
                uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v42 = v27;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Deleting storage at path: %{public}@",  buf,  0xCu);
                }

                [v20 removeItemAtPath:v27 error:0];
              }
            }

            id v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }

          while (v24);
        }

        id v13 = v30;
      }

      else
      {
        id v13 = 0LL;
      }
    }
  }

IAPInfoUpdateRequestContext *sub_100322D40(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  objc_opt_self(a1);
  id v10 = objc_alloc(&OBJC_CLASS___IAPInfoUpdateRequestContext);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 processInfo]);
  if (v7) {
    id Property = objc_getProperty(v7, v11, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = Property;

  id v15 = v9;
  id v16 = v8;
  id v17 = v12;
  id v18 = v14;
  if (v10)
  {
    v21.receiver = v10;
    v21.super_class = (Class)&OBJC_CLASS___IAPInfoUpdateRequestContext;
    id v19 = (IAPInfoUpdateRequestContext *)objc_msgSendSuper2(&v21, "init");
    id v10 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_revision, a2);
      objc_storeStrong((id *)&v10->_account, a3);
      objc_storeStrong((id *)&v10->_clientInfo, v12);
      objc_storeStrong((id *)&v10->_logKey, Property);
    }
  }

  return v10;
}

void *sub_100323378(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___AppInstall;
    id v7 = objc_msgSendSuper2(&v10, "init");
    a1 = v7;
    if (v7)
    {
      sub_100323428(v7, v5, v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      [a1 setValue:v8 forProperty:@"external_id"];
    }
  }

  return a1;
}

void sub_100323428(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!a1) {
    goto LABEL_51;
  }
  id v6 = a2;
  objc_opt_self(&OBJC_CLASS___AppInstall);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_10040D480,  @"source_type");
  if (v6)
  {
    id v9 = objc_getProperty(v6, v8, 24LL, 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  @"alternate_icon_name");

    id Property = objc_getProperty(v6, v10, 96LL, 1);
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  0LL,  @"alternate_icon_name");
    id Property = 0LL;
  }

  id v12 = Property;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, @"bundle_id");

  if (v6)
  {
    id v14 = objc_getProperty(v6, v13, 88LL, 1);
    if (v14)
    {
      id v16 = v14;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, @"bundle_name");

      goto LABEL_9;
    }

    id v18 = objc_getProperty(v6, v15, 216LL, 1);
  }

  else
  {
    id v18 = 0LL;
  }

  id v19 = v18;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v19, @"bundle_name");

  if (!v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  0LL,  @"bundle_version");
    id v22 = 0LL;
    goto LABEL_10;
  }

id sub_100323BE0(id result)
{
  if (result)
  {
    id v1 = result;
    Class result = sub_1001E2698(result, (uint64_t)@"update_type");
    if (result != (id)1) {
      return (id)(sub_1001E2698(v1, (uint64_t)@"automatic_type") != 0LL);
    }
  }

  return result;
}

void *sub_100323C2C(void *result)
{
  if (result) {
    return (void *)(sub_1001E2698(result, (uint64_t)@"update_type") != 0LL);
  }
  return result;
}

void *sub_100323C54(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = (void *)a1[4];
    if (!v2)
    {
      id v3 = -[LogKey initWithAppInstallMemoryEntity:]( objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey),  "initWithAppInstallMemoryEntity:",  a1);
      uint64_t v4 = (void *)v1[4];
      v1[4] = v3;

      uint64_t v2 = (void *)v1[4];
    }

    a1 = v2;
  }

  return a1;
}

void *sub_100323CB4(void *a1)
{
  if (a1)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForProperty:@"policy"]);
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary, v2);
    if ((objc_opt_isKindOfClass(v1, v3) & 1) != 0) {
      uint64_t v4 = sub_1002E6020(objc_alloc(&OBJC_CLASS___AppInstallPolicy), v1);
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

void sub_100323D30(void *a1, id *a2)
{
  if (a1)
  {
    if (a2) {
      a2 = (id *)[a2[1] copy];
    }
    uint64_t v3 = a2;
    [a1 setValue:a2 forProperty:@"policy"];
  }

id sub_100323D88(void *a1)
{
  if (a1)
  {
    id v1 = sub_1001E26D0(a1, (uint64_t)@"bundle_id");
    a1 = (void *)objc_claimAutoreleasedReturnValue(v1);
  }

  return a1;
}

id sub_100323DAC(void *a1)
{
  if (a1)
  {
    id v1 = sub_1001E2734(a1, (uint64_t)@"external_id");
    a1 = (void *)objc_claimAutoreleasedReturnValue(v1);
  }

  return a1;
}

id sub_100323DD0(void *a1)
{
  if (a1)
  {
    id v1 = sub_1001E25D0(a1, (uint64_t)@"item_id");
    a1 = (void *)objc_claimAutoreleasedReturnValue(v1);
  }

  return a1;
}

id sub_100323DF4(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v1 = sub_1001E25D0(a1, (uint64_t)@"priority");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

AppPackage *sub_100323E4C(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    id v7 = sub_1001E6B18((uint64_t)AppPackageEntity, (uint64_t)[a1 databaseID], v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8) {
      id v9 = -[SQLiteMemoryEntity initWithDatabaseEntity:properties:]( objc_alloc(&OBJC_CLASS___AppPackage),  "initWithDatabaseEntity:properties:",  v8,  v5);
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

EvaluatorDownload *sub_100323EF0(void *a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
    id v4 = 0LL;
    goto LABEL_13;
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___EvaluatorDownload);
  id v5 = sub_1001E26D0(a1, (uint64_t)@"client_id");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v4) {
    objc_setProperty_atomic(v4, v6, v7, 24LL);
  }

  id v8 = sub_1001E25D0(v3, (uint64_t)@"bytes_total");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  SEL v10 = v9;
  if (v9)
  {
    id v11 = [v9 unsignedLongLongValue];
    if (v4) {
      v4->_bytes += (unint64_t)v11;
    }
  }

  id v12 = sub_1001E25D0(v3, (uint64_t)@"initial_odr_size");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (!v13)
  {
    unsigned __int8 v16 = sub_100323BE0(a1);
    if (v4) {
      goto LABEL_11;
    }
LABEL_16:
    SEL v21 = sub_100323C54(a1);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_12;
  }

  id v15 = [v13 unsignedLongLongValue];
  if (!v4)
  {
    sub_100323BE0(a1);
    goto LABEL_16;
  }

  v4->_bytes += (unint64_t)v15;
  unsigned __int8 v16 = sub_100323BE0(a1);
LABEL_11:
  v4->_automatic = v16;
  id v17 = sub_100323C54(a1);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_setProperty_atomic(v4, v19, v18, 32LL);
LABEL_12:

LABEL_13:
  return v4;
}

uint64_t sub_100324044(uint64_t result)
{
  if (result)
  {
    id v1 = (void *)result;
    if (sub_1001E2698((id)result, (uint64_t)@"source_type"))
    {
      return 0LL;
    }

    else if (sub_1001E2698(v1, (uint64_t)@"automatic_type") == (id)1)
    {
      return 2LL;
    }

    else
    {
      id v2 = sub_1001E2698(v1, (uint64_t)@"update_type");
      if (v2)
      {
        if (v2 == (id)1) {
          return 3LL;
        }
        else {
          return 6LL;
        }
      }

      else if (sub_1001E2698(v1, (uint64_t)@"restore_type"))
      {
        return 9LL;
      }

      else if (sub_1001E2598(v1, (uint64_t)@"redownload"))
      {
        return 8LL;
      }

      else
      {
        return 4LL;
      }
    }
  }

  return result;
}

id sub_100324100(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v15 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForProperty:@"store_metadata"]);
  if (!v4
    || (id v5 = sub_100303ADC((uint64_t)&OBJC_CLASS___MIStoreMetadata, v4, &v15),
        (id v6 = (void *)objc_claimAutoreleasedReturnValue(v5)) == 0LL))
  {
    uint64_t v7 = ASDLogHandleForCategory(2LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_100323C54(a1);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v14 = [v4 length];
      *(_DWORD *)buf = 138412802;
      id v17 = v13;
      __int16 v18 = 2048;
      id v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@] Store metadata (%{iec-bytes}ld) could not be decoded with error: %{public}@",  buf,  0x20u);
    }

    id v9 = @"No store metadata provided";
    if (v4 && [v4 length]) {
      id v9 = @"Store metadata could not be decoded";
    }
    if (a2)
    {
      uint64_t v10 = ASDErrorWithUnderlyingErrorAndDescription(v15, ASDErrorDomain, 825LL, v9);
      id v6 = 0LL;
      *a2 = (id)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

AppInstall *sub_1003244D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_opt_self(a1);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentID]);
  id v8 = v7;
  if (v7)
  {
    id v9 = sub_1001DB464((uint64_t)NSUUID, (uint64_t)[v7 unsignedLongLongValue]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  }

  id v11 = (void *)v10;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, @"external_id");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"approved");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"LGY",  @"log_code");
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"bundle_id");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 cancelDownloadURL]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v13,  @"cancel_download_url");

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 clientID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, @"client_id");

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 itemID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v15, @"item_id");

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 is32BitOnly]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v16,  @"supports_32bit_only");

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 storeAccountName]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, @"apple_id");

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 storeAccountID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v18, @"account_id");

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 storeTransactionID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v19, @"transaction_id");

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 betaExternalVersionIdentifier]);
  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 betaExternalVersionIdentifier]);
    id v22 = &off_10040D4F8;
    id v23 = &off_10040D4E0;
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 softwareVersionExternalIdentifier]);
    id v22 = &off_10040D528;
    id v23 = &off_10040D510;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v21, @"evid");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v23, @"source_type");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v22,  @"metrics_install_type");
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v24, @"bundle_name");

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleVersion]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v25, @"bundle_version");

  SEL v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 cancelIfDuplicate]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v26,  @"cancel_if_duplicate");

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 hasMessagesExtension]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v27,  @"has_messages_extension");

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 messagesArtworkURL]);
  id v29 = sub_1001F56FC(v28);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v30,  @"messages_artwork_url");

  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 launchProhibited]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v31,  @"launch_prohibited");

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v5 appReceiptData]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v32, @"receipt");

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v5 storefront]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v33, @"storefront");

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v5 storeCohort]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v34, @"store_cohort");

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v5 thumbnailURL]);
  id v36 = sub_1001F56FC(v35);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v37, @"artwork_url");

  __int128 v38 = sub_1002D8EE4((uint64_t)&OBJC_CLASS___MIStoreMetadata, v5);
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  SEL v40 = (void *)objc_claimAutoreleasedReturnValue([v5 storeAccountID]);

  if (v40)
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v5 storeAccountID]);
    uint64_t v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "ams_iTunesAccountWithDSID:", v42));
  }

  else
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v5 storeAccountName]);

    if (!v44) {
      goto LABEL_13;
    }
    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v5 storeAccountName]);
    uint64_t v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "ams_iTunesAccountWithUsername:", v42));
  }

  uint64_t v45 = (void *)v43;

  if (v45)
  {
    sub_1003042C8(v39, v45);
  }

id sub_100324BB4(uint64_t a1, void *a2)
{
  id v3 = sub_10023F220((uint64_t)&OBJC_CLASS___AppPackage, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001E26D0(v4, (uint64_t)@"variant_id");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) variantID]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) variantID]);
      [v4 setValue:v8 forProperty:@"variant_id"];
    }
  }

  return v4;
}

uint64_t sub_100324EF4(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 72) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_55;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0LL;
            goto LABEL_57;
          }
        }

        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_55:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_57:
        uint64_t v40 = 8LL;
        goto LABEL_62;
      case 2u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v20 = 24LL;
        goto LABEL_46;
      case 3u:
        uint64_t v21 = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v20 = 32LL;
        goto LABEL_46;
      case 4u:
        uint64_t v22 = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v20 = 40LL;
        goto LABEL_46;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 72) |= 2u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1LL || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v26 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v14 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                uint64_t v14 = 0LL;
                goto LABEL_61;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_61:
        uint64_t v40 = 16LL;
LABEL_62:
        *(void *)(a1 + v40) = v14;
        continue;
      case 6u:
        uint64_t v27 = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v27);
        uint64_t v20 = 56LL;
        goto LABEL_46;
      case 7u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0LL;
        *(_BYTE *)(a1 + 72) |= 8u;
        while (2)
        {
          unint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v31 == -1LL || v31 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v32 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              BOOL v9 = v29++ >= 9;
              if (v9)
              {
                uint64_t v30 = 0LL;
                goto LABEL_66;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v30 = 0LL;
        }
LABEL_66:
        *(_BYTE *)(a1 + 6_Block_object_dispose((const void *)(v14 - 160), 8) = v30 != 0;
        continue;
      case 8u:
        uint64_t v33 = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v33);
        uint64_t v20 = 48LL;
LABEL_46:
        __int128 v34 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        continue;
      case 9u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0LL;
        *(_BYTE *)(a1 + 72) |= 4u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        continue;
    }

    while (1)
    {
      unint64_t v38 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v38 == -1LL || v38 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v39 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v38);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
      v37 |= (unint64_t)(v39 & 0x7F) << v35;
      if ((v39 & 0x80) == 0) {
        goto LABEL_68;
      }
      v35 += 7;
      BOOL v9 = v36++ >= 9;
      if (v9)
      {
        LODWORD(v37) = 0;
        goto LABEL_70;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_68:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v37) = 0;
    }
LABEL_70:
    *(_DWORD *)(a1 + 64) = v37;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1003254DC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_1003254F4(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void sub_10032550C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

void sub_100325524(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

uint64_t sub_100325A60(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationExtensionRecords", 0));
  id v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 0LL;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v1);
        }
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)i) extensionPointRecord]);
        char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
        unsigned int v9 = [v8 isEqualToString:@"com.apple.message-payload-provider"];

        if (v9) {
          uint64_t v4 = 1LL;
        }
      }

      id v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v3);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

void *sub_100325BAC(void *result)
{
  if (result)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([result executableURL]);
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);

    uint64_t v3 = sub_10029B370((uint64_t)&OBJC_CLASS___FairPlay, v2);
    return (void *)v3;
  }

  return result;
}

id sub_100325C00(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v4 = [(id)objc_opt_self(a1) enumeratorWithOptions:a3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = v5;
  if (a2 <= 2) {
    [v5 setFilter:*(&off_1003F35E8 + a2)];
  }
  return v6;
}

BOOL sub_100325C54(id a1, LSApplicationRecord *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](a2, "typeForInstallMachinery"));
  unsigned __int8 v3 = [v2 isEqualToString:LSUserApplicationType];

  return v3;
}

BOOL sub_100325C98(id a1, LSApplicationRecord *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](a2, "typeForInstallMachinery"));
  unsigned __int8 v3 = [v2 isEqualToString:LSInternalApplicationType];

  return v3;
}

BOOL sub_100325CDC(id a1, LSApplicationRecord *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](a2, "typeForInstallMachinery"));
  unsigned __int8 v3 = [v2 isEqualToString:LSSystemApplicationType];

  return v3;
}

id sub_100325D20(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationExtensionRecords", 0));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 extensionPointRecord]);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);

        if (a2 == 1
          && ([v10 isEqualToString:@"com.apple.message-payload-provider"] & 1) != 0)
        {
          id v11 = v8;

          goto LABEL_13;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_13:

  return v11;
}

id sub_100325E80(id a1)
{
  id v1 = a1;
  if (a1)
  {
    if (([a1 isPlaceholder] & 1) == 0
      && ([v1 applicationHasMIDBasedSINF] & 1) != 0
      || (id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 iTunesMetadata]),
          unsigned int v3 = [v2 isDeviceBasedVPP],
          v2,
          v3))
    {
      id v4 = sub_1001F6A04((uint64_t)&OBJC_CLASS___PurchaseOwner);
      uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
LABEL_12:
      id v1 = (id)v5;
      return v1;
    }

    if (([v1 isPlaceholder] & 1) == 0
      && ([v1 isProfileValidated] & 1) != 0
      || ([v1 isAppStoreVendable] & 1) == 0)
    {
      unint64_t v7 = sub_1001F6988((uint64_t)&OBJC_CLASS___PurchaseOwner);
      uint64_t v5 = objc_claimAutoreleasedReturnValue(v7);
      goto LABEL_12;
    }

    if ([v1 applicationDownloaderDSID])
    {
      id v6 = [v1 applicationDownloaderDSID];
LABEL_16:
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6));
      goto LABEL_17;
    }

    if ([v1 applicationDSID])
    {
      id v6 = [v1 applicationDSID];
      goto LABEL_16;
    }

    id v28 = sub_1003261E8(v1);
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 altDSID]);
    if (v30)
    {
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      char v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ams_iTunesAccountWithAltDSID:", v30));

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_DSID"));
      char v34 = sub_100326374(v33);

      if ((v34 & 1) != 0)
      {
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_DSID"));

        if (v9) {
          goto LABEL_39;
        }
      }

      else
      {
      }
    }

    char v35 = (void *)objc_claimAutoreleasedReturnValue([v29 downloaderID]);
    int v36 = sub_100326374(v35);

    if (v36)
    {
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v29 downloaderID]);
    }

    else
    {
      unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v29 purchaserID]);
      int v39 = sub_100326374(v38);

      if (!v39)
      {
        unsigned int v9 = 0LL;
        goto LABEL_39;
      }

      uint64_t v37 = objc_claimAutoreleasedReturnValue([v29 purchaserID]);
    }

    unsigned int v9 = (void *)v37;
LABEL_39:

LABEL_17:
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));

    if (!v9)
    {
      id v17 = sub_1001F6A80((uint64_t)&OBJC_CLASS___PurchaseOwner);
      id v1 = (id)objc_claimAutoreleasedReturnValue(v17);
LABEL_27:

      return v1;
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
    unsigned int v13 = [v9 isEqual:v12];

    if (v13)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
      __int128 v15 = sub_1001F6A30((uint64_t)&OBJC_CLASS___PurchaseOwner, v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    }

    else
    {
      id v18 = sub_100320738((uint64_t)&OBJC_CLASS___FamilyManager);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = sub_100320BDC(v19);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v20);

      if ([v14 containsObject:v9])
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v1 iTunesMetadata]);
        id v22 = [v21 storeFront];
        char v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_storefront"));
        id v24 = [v23 integerValue];

        if (v22 == v24)
        {
          unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
          char v26 = sub_1001F69B4((uint64_t)&OBJC_CLASS___PurchaseOwner, v25);
          id v1 = (id)objc_claimAutoreleasedReturnValue(v26);

LABEL_26:
          goto LABEL_27;
        }
      }

      uint64_t v27 = sub_1001F68BC((uint64_t)&OBJC_CLASS___PurchaseOwner, v9);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v27);
    }

    id v1 = (id)v16;
    goto LABEL_26;
  }

  return v1;
}

id sub_1003261E8(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v12 = 0LL;
  id v2 = sub_100321BE0((uint64_t)&OBJC_CLASS___AppMetadataLoader, a1, &v12);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v12;
  if (v4)
  {
    uint64_t v5 = ASDLogHandleForCategory(14LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    int v10 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
    *(_DWORD *)buf = 138543618;
    __int128 v14 = v10;
    __int16 v15 = 2114;
    id v16 = v4;
    id v11 = "Error loading metadata for %{public}@: %{public}@";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);

    goto LABEL_4;
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue([v3 protectedMetadata]);
  if (!v8) {
    goto LABEL_5;
  }

  if (v3) {
    goto LABEL_5;
  }
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
    *(_DWORD *)buf = 138543618;
    __int128 v14 = v10;
    __int16 v15 = 2114;
    id v16 = 0LL;
    id v11 = "Error decrypting protected metadata for %{public}@: %{public}@";
    goto LABEL_12;
  }

uint64_t sub_100326374(void *a1)
{
  id v1 = a1;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber, v2);
  if ((objc_opt_isKindOfClass(v1, v3) & 1) != 0) {
    uint64_t v4 = [v1 isEqualToNumber:&off_10040D540] ^ 1;
  }
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return _[a1 App];
}

id objc_msgSend_DSPersonID(void *a1, const char *a2, ...)
{
  return _[a1 DSPersonID];
}

id objc_msgSend_HTTPUserAgent(void *a1, const char *a2, ...)
{
  return _[a1 HTTPUserAgent];
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return _[a1 InFocus];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLForEntityClass:");
}

id objc_msgSend_SQLJoinClausesForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLJoinClausesForEntityClass:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLWithSize_cropStyle_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithSize:cropStyle:format:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_VPNPlugins(void *a1, const char *a2, ...)
{
  return _[a1 VPNPlugins];
}

id objc_msgSend__CFURLRequest(void *a1, const char *a2, ...)
{
  return _[a1 _CFURLRequest];
}

id objc_msgSend__activeAccountIDForAppEvent_withAccountEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeAccountIDForAppEvent:withAccountEvents:");
}

id objc_msgSend__adoptEffectiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adoptEffectiveConfiguration:");
}

id objc_msgSend__arcadeAppCount(void *a1, const char *a2, ...)
{
  return _[a1 _arcadeAppCount];
}

id objc_msgSend__bootstrapWhenReadyWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bootstrapWhenReadyWithInfo:");
}

id objc_msgSend__calculatePurgeableSpace(void *a1, const char *a2, ...)
{
  return _[a1 _calculatePurgeableSpace];
}

id objc_msgSend__effectiveConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveConfiguration];
}

id objc_msgSend__getActiveSessionIdentifiersWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getActiveSessionIdentifiersWithCompletionHandler:");
}

id objc_msgSend__handleMonitorStateDidChangeNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMonitorStateDidChangeNotification:");
}

id objc_msgSend__incompleteTaskMetrics(void *a1, const char *a2, ...)
{
  return _[a1 _incompleteTaskMetrics];
}

id objc_msgSend__initWithCFURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithCFURLRequest:");
}

id objc_msgSend__initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithConfiguration:");
}

id objc_msgSend__internalManager(void *a1, const char *a2, ...)
{
  return _[a1 _internalManager];
}

id objc_msgSend__lp_userVisibleHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lp_userVisibleHost");
}

id objc_msgSend__manifestWithBundle_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_manifestWithBundle:error:");
}

id objc_msgSend__newSelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:");
}

id objc_msgSend__newSelectSQLWithProperties_columns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:columns:");
}

id objc_msgSend__purgeForDesiredSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purgeForDesiredSpace:");
}

id objc_msgSend__qualifiedEventsForWeekStartingWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_qualifiedEventsForWeekStartingWithDate:");
}

id objc_msgSend__recordCrashEventsSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordCrashEventsSinceDate:");
}

id objc_msgSend__sessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _sessionConfiguration];
}

id objc_msgSend__setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBundleID:");
}

id objc_msgSend__setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setError:");
}

id objc_msgSend__setItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setItemID:");
}

id objc_msgSend__setPurchase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPurchase:");
}

id objc_msgSend__setRequiresShortConnectionTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRequiresShortConnectionTimeout:");
}

id objc_msgSend__setSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSuccess:");
}

id objc_msgSend__shouldUseModernUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUseModernUpdates];
}

id objc_msgSend__tcr_associateWithReader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tcr_associateWithReader:");
}

id objc_msgSend__tcr_associatedReader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tcr_associatedReader");
}

id objc_msgSend__topShelfContentDidChangeForApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_topShelfContentDidChangeForApplicationBundleIdentifier:");
}

id objc_msgSend__unboostingRemoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 _unboostingRemoteObjectProxy];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 absoluteTimestamp];
}

id objc_msgSend_acceptHeaderValue(void *a1, const char *a2, ...)
{
  return _[a1 acceptHeaderValue];
}

id objc_msgSend_acceptVisitor_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptVisitor:flags:");
}

id objc_msgSend_accessUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessUsingBlock:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accountIdentifier];
}

id objc_msgSend_accountMediaType(void *a1, const char *a2, ...)
{
  return _[a1 accountMediaType];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return _[a1 accountName];
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_actionButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 actionButtonTitle];
}

id objc_msgSend_actionButtonURL(void *a1, const char *a2, ...)
{
  return _[a1 actionButtonURL];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_actionMetricsEvent(void *a1, const char *a2, ...)
{
  return _[a1 actionMetricsEvent];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return _[a1 actionType];
}

id objc_msgSend_actionWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:");
}

id objc_msgSend_actionWithTitle_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:identifier:");
}

id objc_msgSend_actionWithTitle_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
}

id objc_msgSend_activeRestoreSupportEnabled(void *a1, const char *a2, ...)
{
  return _[a1 activeRestoreSupportEnabled];
}

id objc_msgSend_activeSandboxAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeSandboxAccount];
}

id objc_msgSend_adamId(void *a1, const char *a2, ...)
{
  return _[a1 adamId];
}

id objc_msgSend_adamIds(void *a1, const char *a2, ...)
{
  return _[a1 adamIds];
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBarrierBlock:");
}

id objc_msgSend_addButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButtonAction:");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addInstall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInstall:");
}

id objc_msgSend_addKeyValuePair_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyValuePair:with:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperations:waitUntilFinished:");
}

id objc_msgSend_addPoll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPoll:");
}

id objc_msgSend_addPropertiesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPropertiesWithDictionary:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_addTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextField:");
}

id objc_msgSend_additionalHeaders(void *a1, const char *a2, ...)
{
  return _[a1 additionalHeaders];
}

id objc_msgSend_additionalMetricsWithRestoreInstalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalMetricsWithRestoreInstalls:");
}

id objc_msgSend_affiliateIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 affiliateIdentifier];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPurgeablesForVolume_reason_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPurgeablesForVolume:reason:client:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowAutomaticDownloads(void *a1, const char *a2, ...)
{
  return _[a1 allowAutomaticDownloads];
}

id objc_msgSend_allowEvaluation(void *a1, const char *a2, ...)
{
  return _[a1 allowEvaluation];
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsCellularAccess];
}

id objc_msgSend_allowsConstrainedNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsConstrainedNetworkAccess];
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsExpensiveNetworkAccess];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 alphanumericCharacterSet];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiCloudAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiCloudAccount");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_configurationWithProcessInfo_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_configurationWithProcessInfo:bag:");
}

id objc_msgSend_ams_configureWithProcessInfo_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_configureWithProcessInfo:bag:");
}

id objc_msgSend_ams_iTunesAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountWithAltDSID:");
}

id objc_msgSend_ams_iTunesAccountWithDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountWithDSID:");
}

id objc_msgSend_ams_iTunesAccountWithUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccountWithUsername:");
}

id objc_msgSend_ams_iTunesAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_iTunesAccounts");
}

id objc_msgSend_ams_isDemoAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isDemoAccount");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_isSandboxAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isSandboxAccount");
}

id objc_msgSend_ams_mapWithTransformIgnoresNil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_mapWithTransformIgnoresNil:");
}

id objc_msgSend_ams_secureTokenForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_secureTokenForAccount:");
}

id objc_msgSend_ams_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setAltDSID:");
}

id objc_msgSend_ams_setNullableObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setNullableObject:forKey:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_appAdamID(void *a1, const char *a2, ...)
{
  return _[a1 appAdamID];
}

id objc_msgSend_appAdamId(void *a1, const char *a2, ...)
{
  return _[a1 appAdamId];
}

id objc_msgSend_appAssetPromiseResponsibleClientWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appAssetPromiseResponsibleClientWithError:");
}

id objc_msgSend_appAssetPromiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appAssetPromiseWithError:");
}

id objc_msgSend_appEventEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 appEventEntityClass];
}

id objc_msgSend_appPlatform(void *a1, const char *a2, ...)
{
  return _[a1 appPlatform];
}

id objc_msgSend_appReceiptData(void *a1, const char *a2, ...)
{
  return _[a1 appReceiptData];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _[a1 appState];
}

id objc_msgSend_appStoreToolsBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 appStoreToolsBuildVersion];
}

id objc_msgSend_appUptime(void *a1, const char *a2, ...)
{
  return _[a1 appUptime];
}

id objc_msgSend_appUsageType(void *a1, const char *a2, ...)
{
  return _[a1 appUsageType];
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _[a1 appVersion];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return _[a1 appleID];
}

id objc_msgSend_applicationDSID(void *a1, const char *a2, ...)
{
  return _[a1 applicationDSID];
}

id objc_msgSend_applicationDownloaderDSID(void *a1, const char *a2, ...)
{
  return _[a1 applicationDownloaderDSID];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return _[a1 applicationExtensionRecords];
}

id objc_msgSend_applicationFamilyID(void *a1, const char *a2, ...)
{
  return _[a1 applicationFamilyID];
}

id objc_msgSend_applicationHasMIDBasedSINF(void *a1, const char *a2, ...)
{
  return _[a1 applicationHasMIDBasedSINF];
}

id objc_msgSend_applicationIdentity(void *a1, const char *a2, ...)
{
  return _[a1 applicationIdentity];
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_applicationMissingRequiredSINF(void *a1, const char *a2, ...)
{
  return _[a1 applicationMissingRequiredSINF];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return _[a1 applicationType];
}

id objc_msgSend_applyBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBinding:atIndex:");
}

id objc_msgSend_apps(void *a1, const char *a2, ...)
{
  return _[a1 apps];
}

id objc_msgSend_architecture(void *a1, const char *a2, ...)
{
  return _[a1 architecture];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return _[a1 artistName];
}

id objc_msgSend_artworkURL(void *a1, const char *a2, ...)
{
  return _[a1 artworkURL];
}

id objc_msgSend_ascending(void *a1, const char *a2, ...)
{
  return _[a1 ascending];
}

id objc_msgSend_assetServerUrl(void *a1, const char *a2, ...)
{
  return _[a1 assetServerUrl];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return _[a1 assetType];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _[a1 assetURL];
}

id objc_msgSend_assetWithUrl_variant_isDelta_isParallel_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetWithUrl:variant:isDelta:isParallel:logKey:");
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return _[a1 assets];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributesOfFileSystemForPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfFileSystemForPath:error:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 authIfNeeded];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return _[a1 authenticationMethod];
}

id objc_msgSend_authenticationType(void *a1, const char *a2, ...)
{
  return _[a1 authenticationType];
}

id objc_msgSend_autoRenewEnabled(void *a1, const char *a2, ...)
{
  return _[a1 autoRenewEnabled];
}

id objc_msgSend_autoRenewStatus(void *a1, const char *a2, ...)
{
  return _[a1 autoRenewStatus];
}

id objc_msgSend_autoUpdateEnabled(void *a1, const char *a2, ...)
{
  return _[a1 autoUpdateEnabled];
}

id objc_msgSend_autoUpdateEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoUpdateEnabled:");
}

id objc_msgSend_averagePollTime(void *a1, const char *a2, ...)
{
  return _[a1 averagePollTime];
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_badgeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 badgeIdentifier];
}

id objc_msgSend_bagForProfile_profileVersion_processInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:processInfo:");
}

id objc_msgSend_bagKey(void *a1, const char *a2, ...)
{
  return _[a1 bagKey];
}

id objc_msgSend_bagValueWithKey_valueType_valuePromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagValueWithKey:valueType:valuePromise:");
}

id objc_msgSend_base64EncodedDataWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedDataWithOptions:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_batchLogKey(void *a1, const char *a2, ...)
{
  return _[a1 batchLogKey];
}

id objc_msgSend_batteryPercentage(void *a1, const char *a2, ...)
{
  return _[a1 batteryPercentage];
}

id objc_msgSend_becomeCurrentWithPendingUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeCurrentWithPendingUnitCount:");
}

id objc_msgSend_beginRequestForHostContext_XPCInterface_executionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginRequestForHostContext:XPCInterface:executionBlock:");
}

id objc_msgSend_betaBuildGroupID(void *a1, const char *a2, ...)
{
  return _[a1 betaBuildGroupID];
}

id objc_msgSend_betaExternalVersionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 betaExternalVersionIdentifier];
}

id objc_msgSend_betaVersionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 betaVersionIdentifier];
}

id objc_msgSend_binaryPromiseAdapter(void *a1, const char *a2, ...)
{
  return _[a1 binaryPromiseAdapter];
}

id objc_msgSend_bindArray_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindArray:atPosition:");
}

id objc_msgSend_bindData_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindData:atPosition:");
}

id objc_msgSend_bindDictionary_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDictionary:atPosition:");
}

id objc_msgSend_bindDouble_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDouble:atPosition:");
}

id objc_msgSend_bindInt64_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindInt64:atPosition:");
}

id objc_msgSend_bindInt_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindInt:atPosition:");
}

id objc_msgSend_bindNullAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNullAtPosition:");
}

id objc_msgSend_bindNumber_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNumber:atPosition:");
}

id objc_msgSend_bindString_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindString:atPosition:");
}

id objc_msgSend_bindUUID_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindUUID:atPosition:");
}

id objc_msgSend_blindedElement(void *a1, const char *a2, ...)
{
  return _[a1 blindedElement];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_BOOLeanPropertyMaskKey(void *a1, const char *a2, ...)
{
  return _[a1 BOOLeanPropertyMaskKey];
}

id objc_msgSend_bridgedTargetedItemID(void *a1, const char *a2, ...)
{
  return _[a1 bridgedTargetedItemID];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleContainerURL];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDPropertyKey(void *a1, const char *a2, ...)
{
  return _[a1 bundleIDPropertyKey];
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 bundleIDs];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _[a1 bundlePath];
}

id objc_msgSend_bundleRecordWithApplicationIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithApplicationIdentifier:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleShortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 bundleShortVersionString];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_buttonActions(void *a1, const char *a2, ...)
{
  return _[a1 buttonActions];
}

id objc_msgSend_buyParameters(void *a1, const char *a2, ...)
{
  return _[a1 buyParameters];
}

id objc_msgSend_buyParams(void *a1, const char *a2, ...)
{
  return _[a1 buyParams];
}

id objc_msgSend_buyParamsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyParamsWithString:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_bytesTotal(void *a1, const char *a2, ...)
{
  return _[a1 bytesTotal];
}

id objc_msgSend_cacheInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 cacheInvalidated];
}

id objc_msgSend_callbackHandler(void *a1, const char *a2, ...)
{
  return _[a1 callbackHandler];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelDownloadURL(void *a1, const char *a2, ...)
{
  return _[a1 cancelDownloadURL];
}

id objc_msgSend_cancelForReason_client_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelForReason:client:error:");
}

id objc_msgSend_cancelIfDuplicate(void *a1, const char *a2, ...)
{
  return _[a1 cancelIfDuplicate];
}

id objc_msgSend_cancelPurge(void *a1, const char *a2, ...)
{
  return _[a1 cancelPurge];
}

id objc_msgSend_cancelUsingProxy_withErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelUsingProxy:withErrorHandler:");
}

id objc_msgSend_canonicalExecutablePath(void *a1, const char *a2, ...)
{
  return _[a1 canonicalExecutablePath];
}

id objc_msgSend_carrier(void *a1, const char *a2, ...)
{
  return _[a1 carrier];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_catalogRefreshedBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catalogRefreshedBundleIDs:");
}

id objc_msgSend_catalogRegisteredApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catalogRegisteredApps:");
}

id objc_msgSend_catalogUnregisteredBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catalogUnregisteredBundleIDs:");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_cellularDataPrompt(void *a1, const char *a2, ...)
{
  return _[a1 cellularDataPrompt];
}

id objc_msgSend_cellularNetworkType(void *a1, const char *a2, ...)
{
  return _[a1 cellularNetworkType];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return _[a1 certificate];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkStoreQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkStoreQueue:");
}

id objc_msgSend_circularIconURLString(void *a1, const char *a2, ...)
{
  return _[a1 circularIconURLString];
}

id objc_msgSend_clearLaunchHistoryWithBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLaunchHistoryWithBundleIDs:");
}

id objc_msgSend_clearStatusCondition_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStatusCondition:completionHandler:");
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _[a1 clientID];
}

id objc_msgSend_clientIDForConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIDForConnection:");
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_clientType(void *a1, const char *a2, ...)
{
  return _[a1 clientType];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeAndReturnError:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_codeSignatureVersion(void *a1, const char *a2, ...)
{
  return _[a1 codeSignatureVersion];
}

id objc_msgSend_comments(void *a1, const char *a2, ...)
{
  return _[a1 comments];
}

id objc_msgSend_companionBundleID(void *a1, const char *a2, ...)
{
  return _[a1 companionBundleID];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compareObject_toObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareObject:toObject:");
}

id objc_msgSend_comparisonType(void *a1, const char *a2, ...)
{
  return _[a1 comparisonType];
}

id objc_msgSend_completeDataPromise(void *a1, const char *a2, ...)
{
  return _[a1 completeDataPromise];
}

id objc_msgSend_completeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeWithError:");
}

id objc_msgSend_completeWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 completeWithSuccess];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return _[a1 completedUnitCount];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return _[a1 completionHandlerAdapter];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_compoundPredicateType(void *a1, const char *a2, ...)
{
  return _[a1 compoundPredicateType];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _[a1 condition];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configureClientWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureClientWithConnection:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionNeedsResetForCorruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForCorruption:");
}

id objc_msgSend_connectionNeedsResetForReopen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForReopen:");
}

id objc_msgSend_constantValue(void *a1, const char *a2, ...)
{
  return _[a1 constantValue];
}

id objc_msgSend_consumeData_andWaitWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeData:andWaitWithCompletionHandler:");
}

id objc_msgSend_consumeData_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeData:withCompletionHandler:");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsPredicateWithProperty_values_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsPredicateWithProperty:values:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentRatingFlags(void *a1, const char *a2, ...)
{
  return _[a1 contentRatingFlags];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentTypeHeaderValue(void *a1, const char *a2, ...)
{
  return _[a1 contentTypeHeaderValue];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return _[a1 coordinator];
}

id objc_msgSend_coordinatorForAppWithIdentity_withClientID_createIfNotExisting_created_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:");
}

id objc_msgSend_coordinatorImportance(void *a1, const char *a2, ...)
{
  return _[a1 coordinatorImportance];
}

id objc_msgSend_coordinatorIntent(void *a1, const char *a2, ...)
{
  return _[a1 coordinatorIntent];
}

id objc_msgSend_coordinatorPromiseDataConsumer_willBeginUsingPromise_forReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinatorPromiseDataConsumer:willBeginUsingPromise:forReference:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 copyConfiguration];
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copySelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copySelectSQLWithProperties:");
}

id objc_msgSend_copyThinningHeadersForPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyThinningHeadersForPlatform:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return _[a1 correlationID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToReceive];
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesReceived];
}

id objc_msgSend_countOfEntities(void *a1, const char *a2, ...)
{
  return _[a1 countOfEntities];
}

id objc_msgSend_countOfResponseBodyBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfResponseBodyBytesReceived];
}

id objc_msgSend_createActivityGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivityGroup:");
}

id objc_msgSend_createAppEventsForBundleIDs_eventType_installType_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAppEventsForBundleIDs:eventType:installType:connection:");
}

id objc_msgSend_createAppEventsWithLaunchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAppEventsWithLaunchEvents:");
}

id objc_msgSend_createAsMobileBackup(void *a1, const char *a2, ...)
{
  return _[a1 createAsMobileBackup];
}

id objc_msgSend_createDeviceIdentifierWithVendorName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDeviceIdentifierWithVendorName:bundleIdentifier:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createMetricsEventsForEventType_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMetricsEventsForEventType:context:");
}

id objc_msgSend_createOrMigrateStoreUsingSchema_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrMigrateStoreUsingSchema:");
}

id objc_msgSend_createRestoreFromCoordinatorWithCoordinator_policy_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRestoreFromCoordinatorWithCoordinator:policy:error:");
}

id objc_msgSend_createSnapshotWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSnapshotWithCompletion:");
}

id objc_msgSend_createsJobs(void *a1, const char *a2, ...)
{
  return _[a1 createsJobs];
}

id objc_msgSend_createsPlaceholders(void *a1, const char *a2, ...)
{
  return _[a1 createsPlaceholders];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_creatorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 creatorIdentifier];
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_credentialWithUser_password_persistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialWithUser:password:persistence:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentRequest];
}

id objc_msgSend_currentStatsString(void *a1, const char *a2, ...)
{
  return _[a1 currentStatsString];
}

id objc_msgSend_currentVersionReleaseDate(void *a1, const char *a2, ...)
{
  return _[a1 currentVersionReleaseDate];
}

id objc_msgSend_currentlyOptedInForMacOSEligibility(void *a1, const char *a2, ...)
{
  return _[a1 currentlyOptedInForMacOSEligibility];
}

id objc_msgSend_currentlyOptedInForXROSEligibility(void *a1, const char *a2, ...)
{
  return _[a1 currentlyOptedInForXROSEligibility];
}

id objc_msgSend_dPInfo(void *a1, const char *a2, ...)
{
  return _[a1 dPInfo];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataDetectorWithTypes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataDetectorWithTypes:error:");
}

id objc_msgSend_dataForRequestWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForRequestWithError:");
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataUsingEncoding_allowLossyConversion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_databaseEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 databaseEntityClass];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_databaseTable(void *a1, const char *a2, ...)
{
  return _[a1 databaseTable];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_datePurchased(void *a1, const char *a2, ...)
{
  return _[a1 datePurchased];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_deadline(void *a1, const char *a2, ...)
{
  return _[a1 deadline];
}

id objc_msgSend_debugReason(void *a1, const char *a2, ...)
{
  return _[a1 debugReason];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decorateMetricsEvent_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decorateMetricsEvent:context:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProperties(void *a1, const char *a2, ...)
{
  return _[a1 defaultProperties];
}

id objc_msgSend_defaultSession(void *a1, const char *a2, ...)
{
  return _[a1 defaultSession];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllEntities(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllEntities];
}

id objc_msgSend_deleteFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 deleteFromDatabase];
}

id objc_msgSend_deliverAlertPresentationRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverAlertPresentationRequest:resultHandler:");
}

id objc_msgSend_deliverAuthenticateRequest_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverAuthenticateRequest:withResultHandler:");
}

id objc_msgSend_deliverDialogRequest_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverDialogRequest:withResultHandler:");
}

id objc_msgSend_deliverEngagementRequest_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverEngagementRequest:withResultHandler:");
}

id objc_msgSend_deliverNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverNotifications:");
}

id objc_msgSend_deliverNotifications_withBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverNotifications:withBarrierBlock:");
}

id objc_msgSend_deliverProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverProgress:");
}

id objc_msgSend_deliverProgress_withBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverProgress:withBarrierBlock:");
}

id objc_msgSend_deliverViewPresentationRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverViewPresentationRequest:resultHandler:");
}

id objc_msgSend_demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptiveName(void *a1, const char *a2, ...)
{
  return _[a1 descriptiveName];
}

id objc_msgSend_desiredPurgeAmount(void *a1, const char *a2, ...)
{
  return _[a1 desiredPurgeAmount];
}

id objc_msgSend_developerName(void *a1, const char *a2, ...)
{
  return _[a1 developerName];
}

id objc_msgSend_deviceBasedVPP(void *a1, const char *a2, ...)
{
  return _[a1 deviceBasedVPP];
}

id objc_msgSend_deviceGUID(void *a1, const char *a2, ...)
{
  return _[a1 deviceGUID];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return _[a1 deviceID];
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifierForVendor];
}

id objc_msgSend_deviceIsAppleTV(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAppleTV];
}

id objc_msgSend_deviceIsAppleWatch(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsAppleWatch];
}

id objc_msgSend_deviceIsMac(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsMac];
}

id objc_msgSend_deviceIsiPad(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPad];
}

id objc_msgSend_deviceIsiPod(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsiPod];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_deviceSecurityPromiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceSecurityPromiseWithError:");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_diagnosticDescription(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticDescription];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_didChangeJobs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeJobs:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didCompleteJobs_finalPhases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCompleteJobs:finalPhases:");
}

id objc_msgSend_didReachTerminalPhaseWithBetaBundle_terminalPhase_error_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReachTerminalPhaseWithBetaBundle:terminalPhase:error:reply:");
}

id objc_msgSend_didReceivePushMessages_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceivePushMessages:reply:");
}

id objc_msgSend_didReceivePushToken_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceivePushToken:reply:");
}

id objc_msgSend_didShowPaymentSheet(void *a1, const char *a2, ...)
{
  return _[a1 didShowPaymentSheet];
}

id objc_msgSend_didUpdateProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateProgress:");
}

id objc_msgSend_didUpdateStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateStates:");
}

id objc_msgSend_disableBoosting(void *a1, const char *a2, ...)
{
  return _[a1 disableBoosting];
}

id objc_msgSend_disambiguatedSQLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguatedSQLForProperty:");
}

id objc_msgSend_discoveredUpdate(void *a1, const char *a2, ...)
{
  return _[a1 discoveredUpdate];
}

id objc_msgSend_discreteProgressWithTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discreteProgressWithTotalUnitCount:");
}

id objc_msgSend_diskAvailable(void *a1, const char *a2, ...)
{
  return _[a1 diskAvailable];
}

id objc_msgSend_diskTotal(void *a1, const char *a2, ...)
{
  return _[a1 diskTotal];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return _[a1 diskUsage];
}

id objc_msgSend_displayDeleteActiveRestoreDialogWithBundleID_logKey_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayDeleteActiveRestoreDialogWithBundleID:logKey:completion:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_doesNotContainPredicateWithProperty_values_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotContainPredicateWithProperty:values:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadLoadURLEventMetricsOverlayWithInstall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadLoadURLEventMetricsOverlayWithInstall:");
}

id objc_msgSend_downloadTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTaskWithRequest:completionHandler:");
}

id objc_msgSend_downloaderDSID(void *a1, const char *a2, ...)
{
  return _[a1 downloaderDSID];
}

id objc_msgSend_downloaderID(void *a1, const char *a2, ...)
{
  return _[a1 downloaderID];
}

id objc_msgSend_dropAllUpdatesIncludingVPP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dropAllUpdatesIncludingVPP:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveValueForSetting:");
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _[a1 email];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endContainerWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endContainerWithCode:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endRequest(void *a1, const char *a2, ...)
{
  return _[a1 endRequest];
}

id objc_msgSend_endpointWithHostname_port_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointWithHostname:port:");
}

id objc_msgSend_engagementData(void *a1, const char *a2, ...)
{
  return _[a1 engagementData];
}

id objc_msgSend_enquePurchases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enquePurchases:");
}

id objc_msgSend_enqueueAppInstallationEventWithEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueAppInstallationEventWithEvent:");
}

id objc_msgSend_enqueueData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueData:");
}

id objc_msgSend_enqueueEvent_flushEvents_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueEvent:flushEvents:completionHandler:");
}

id objc_msgSend_enqueueEvents_flushEvents_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueEvents:flushEvents:completionHandler:");
}

id objc_msgSend_enqueueIdentityProviderAppsQueryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueIdentityProviderAppsQueryWithCompletion:");
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return _[a1 entitlement];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumerateActivitiesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateActivitiesUsingBlock:");
}

id objc_msgSend_enumerateApplicationsOfType_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateApplicationsOfType:usingBlock:");
}

id objc_msgSend_enumerateByteRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateByteRangesUsingBlock:");
}

id objc_msgSend_enumerateCoordinatorsWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateCoordinatorsWithError:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesWithProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesWithProperties:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_enumeratePersistentIDsAndProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsAndProperties:usingBlock:");
}

id objc_msgSend_enumeratePersistentIDsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _[a1 eventBody];
}

id objc_msgSend_eventSubtype(void *a1, const char *a2, ...)
{
  return _[a1 eventSubtype];
}

id objc_msgSend_eventTime(void *a1, const char *a2, ...)
{
  return _[a1 eventTime];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _[a1 eventType];
}

id objc_msgSend_evid(void *a1, const char *a2, ...)
{
  return _[a1 evid];
}

id objc_msgSend_exactBundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 exactBundleVersion];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return _[a1 executableURL];
}

id objc_msgSend_executeQuery_excludingBundleIDs_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:excludingBundleIDs:usingBlock:");
}

id objc_msgSend_executeQueryForUpdatesReloadingFromServer_logKey_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQueryForUpdatesReloadingFromServer:logKey:usingBlock:");
}

id objc_msgSend_existingCoordinatorForAppWithIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingCoordinatorForAppWithIdentity:error:");
}

id objc_msgSend_existsInDatabase(void *a1, const char *a2, ...)
{
  return _[a1 existsInDatabase];
}

id objc_msgSend_exitReason(void *a1, const char *a2, ...)
{
  return _[a1 exitReason];
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return _[a1 expectedContentLength];
}

id objc_msgSend_expectedSoftwarePlatform(void *a1, const char *a2, ...)
{
  return _[a1 expectedSoftwarePlatform];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return _[a1 expiryDate];
}

id objc_msgSend_expressionType(void *a1, const char *a2, ...)
{
  return _[a1 expressionType];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _[a1 extensionPointRecord];
}

id objc_msgSend_extensionReceiptURLs(void *a1, const char *a2, ...)
{
  return _[a1 extensionReceiptURLs];
}

id objc_msgSend_extensions(void *a1, const char *a2, ...)
{
  return _[a1 extensions];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return _[a1 externalID];
}

id objc_msgSend_externalPropertyValues(void *a1, const char *a2, ...)
{
  return _[a1 externalPropertyValues];
}

id objc_msgSend_externalVersionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 externalVersionIdentifier];
}

id objc_msgSend_extractionPath(void *a1, const char *a2, ...)
{
  return _[a1 extractionPath];
}

id objc_msgSend_fairPlayStatus(void *a1, const char *a2, ...)
{
  return _[a1 fairPlayStatus];
}

id objc_msgSend_fairplayContextWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairplayContextWithError:");
}

id objc_msgSend_fairplayStatus(void *a1, const char *a2, ...)
{
  return _[a1 fairplayStatus];
}

id objc_msgSend_familyID(void *a1, const char *a2, ...)
{
  return _[a1 familyID];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForUpdatingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForUpdatingAtPath:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 fileModificationDate];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterUsingPredicate:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalizedToken(void *a1, const char *a2, ...)
{
  return _[a1 finalizedToken];
}

id objc_msgSend_finishInstallID_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishInstallID:transaction:");
}

id objc_msgSend_finishStreamWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishStreamWithCompletionBlock:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 finishTasksAndInvalidate];
}

id objc_msgSend_finishWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithCompletionHandler:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 finishWithSuccess];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushWithCompletionHandler:");
}

id objc_msgSend_foreignDatabaseColumnForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseColumnForProperty:");
}

id objc_msgSend_foreignDatabaseTableForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseTableForProperty:");
}

id objc_msgSend_foreignDatabaseTablesToDelete(void *a1, const char *a2, ...)
{
  return _[a1 foreignDatabaseTablesToDelete];
}

id objc_msgSend_foreignKeyColumnForTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignKeyColumnForTable:");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return _[a1 fractionCompleted];
}

id objc_msgSend_gameCenterEnabledGameInstalled_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gameCenterEnabledGameInstalled:withCompletionHandler:");
}

id objc_msgSend_generateEventFieldsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateEventFieldsForKeys:");
}

id objc_msgSend_generatedVendorID(void *a1, const char *a2, ...)
{
  return _[a1 generatedVendorID];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return _[a1 genre];
}

id objc_msgSend_genreID(void *a1, const char *a2, ...)
{
  return _[a1 genreID];
}

id objc_msgSend_genreName(void *a1, const char *a2, ...)
{
  return _[a1 genreName];
}

id objc_msgSend_getAppEventsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppEventsWithError:");
}

id objc_msgSend_getAppUsageSessionForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppUsageSessionForBundleID:");
}

id objc_msgSend_getBiomeLaunchesWithLogKey_dateInterval_latestLaunchOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBiomeLaunchesWithLogKey:dateInterval:latestLaunchOnly:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getCrashEventsSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCrashEventsSinceDate:");
}

id objc_msgSend_getHasDeviceSecurityPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHasDeviceSecurityPromise:error:");
}

id objc_msgSend_getLaunchesWithLogKey_dateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLaunchesWithLogKey:dateInterval:");
}

id objc_msgSend_getManagedUpdatesWithRequestToken_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getManagedUpdatesWithRequestToken:replyHandler:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getUpdateMetadataForBundleID_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUpdateMetadataForBundleID:replyHandler:");
}

id objc_msgSend_getUpdatesWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUpdatesWithContext:");
}

id objc_msgSend_getUpdatesWithRequestToken_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUpdatesWithRequestToken:replyHandler:");
}

id objc_msgSend_getValuesForProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValuesForProperties:");
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 globallyUniqueString];
}

id objc_msgSend_groupWithName_maxConcurrent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithName:maxConcurrent:");
}

id objc_msgSend_handleActiveRestoreWithCoordinator_userInitiated_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleActiveRestoreWithCoordinator:userInitiated:logKey:");
}

id objc_msgSend_handleAuthenticateRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAuthenticateRequest:resultHandler:");
}

id objc_msgSend_handleDialogRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDialogRequest:resultHandler:");
}

id objc_msgSend_handleEngagementRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEngagementRequest:resultHandler:");
}

id objc_msgSend_handleExternalPurchaseTokenInfoDictionary_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleExternalPurchaseTokenInfoDictionary:bundleID:");
}

id objc_msgSend_handleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotification:");
}

id objc_msgSend_handleNotificationResponse_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotificationResponse:bag:");
}

id objc_msgSend_handlesAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 handlesAuthentication];
}

id objc_msgSend_hasAppAssetPromise(void *a1, const char *a2, ...)
{
  return _[a1 hasAppAssetPromise];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return _[a1 hasBytesAvailable];
}

id objc_msgSend_hasInitialODRAssetPromises(void *a1, const char *a2, ...)
{
  return _[a1 hasInitialODRAssetPromises];
}

id objc_msgSend_hasInstallOptions(void *a1, const char *a2, ...)
{
  return _[a1 hasInstallOptions];
}

id objc_msgSend_hasMIDBasedSINF(void *a1, const char *a2, ...)
{
  return _[a1 hasMIDBasedSINF];
}

id objc_msgSend_hasMessagesExtension(void *a1, const char *a2, ...)
{
  return _[a1 hasMessagesExtension];
}

id objc_msgSend_hasP3(void *a1, const char *a2, ...)
{
  return _[a1 hasP3];
}

id objc_msgSend_hasPlaceholderPromise(void *a1, const char *a2, ...)
{
  return _[a1 hasPlaceholderPromise];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRestoringCoordinatorForBundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRestoringCoordinatorForBundleID:logKey:");
}

id objc_msgSend_hasUsedFreeOffer(void *a1, const char *a2, ...)
{
  return _[a1 hasUsedFreeOffer];
}

id objc_msgSend_hasUsedIntroPricingOffer(void *a1, const char *a2, ...)
{
  return _[a1 hasUsedIntroPricingOffer];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashArrayData(void *a1, const char *a2, ...)
{
  return _[a1 hashArrayData];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_hashType(void *a1, const char *a2, ...)
{
  return _[a1 hashType];
}

id objc_msgSend_hashedDescription(void *a1, const char *a2, ...)
{
  return _[a1 hashedDescription];
}

id objc_msgSend_headboardProvisionedApps(void *a1, const char *a2, ...)
{
  return _[a1 headboardProvisionedApps];
}

id objc_msgSend_hidePendingUpdatesBadge(void *a1, const char *a2, ...)
{
  return _[a1 hidePendingUpdatesBadge];
}

id objc_msgSend_hideUserPrompts(void *a1, const char *a2, ...)
{
  return _[a1 hideUserPrompts];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_humanReadableReason(void *a1, const char *a2, ...)
{
  return _[a1 humanReadableReason];
}

id objc_msgSend_iAdAttribution(void *a1, const char *a2, ...)
{
  return _[a1 iAdAttribution];
}

id objc_msgSend_iAdConversionDate(void *a1, const char *a2, ...)
{
  return _[a1 iAdConversionDate];
}

id objc_msgSend_iAdImpressionDate(void *a1, const char *a2, ...)
{
  return _[a1 iAdImpressionDate];
}

id objc_msgSend_iOSSupportVersion(void *a1, const char *a2, ...)
{
  return _[a1 iOSSupportVersion];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadata];
}

id objc_msgSend_iconForApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconForApplicationIdentifier:");
}

id objc_msgSend_iconURLString(void *a1, const char *a2, ...)
{
  return _[a1 iconURLString];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return _[a1 identity];
}

id objc_msgSend_ignoreRequirePasswordRestriction(void *a1, const char *a2, ...)
{
  return _[a1 ignoreRequirePasswordRestriction];
}

id objc_msgSend_imagesData(void *a1, const char *a2, ...)
{
  return _[a1 imagesData];
}

id objc_msgSend_importKeybagWithData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importKeybagWithData:error:");
}

id objc_msgSend_importanceWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importanceWithError:");
}

id objc_msgSend_incidentID(void *a1, const char *a2, ...)
{
  return _[a1 incidentID];
}

id objc_msgSend_includeArcade(void *a1, const char *a2, ...)
{
  return _[a1 includeArcade];
}

id objc_msgSend_includeClipDetails(void *a1, const char *a2, ...)
{
  return _[a1 includeClipDetails];
}

id objc_msgSend_includeMetrics(void *a1, const char *a2, ...)
{
  return _[a1 includeMetrics];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initAppPlaceholderWithBundleName_bundleID_installType_client_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initAppPlaceholderWithBundleName:bundleID:installType:client:error:");
}

id objc_msgSend_initForClient_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForClient:withOptions:");
}

id objc_msgSend_initForInstallMachineryWithBundleIdentifier_placeholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForInstallMachineryWithBundleIdentifier:placeholder:error:");
}

id objc_msgSend_initForInternalClient(void *a1, const char *a2, ...)
{
  return _[a1 initForInternalClient];
}

id objc_msgSend_initOnConnection_descriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOnConnection:descriptor:");
}

id objc_msgSend_initOnScheduler_withExecutor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOnScheduler:withExecutor:");
}

id objc_msgSend_initToMemory(void *a1, const char *a2, ...)
{
  return _[a1 initToMemory];
}

id objc_msgSend_initWithAccount_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:");
}

id objc_msgSend_initWithAccount_options_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:bag:");
}

id objc_msgSend_initWithAccountID_askToBuyEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountID:askToBuyEnabled:");
}

id objc_msgSend_initWithAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountType:");
}

id objc_msgSend_initWithAppInstallDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppInstallDictionary:");
}

id objc_msgSend_initWithAppInstallEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppInstallEntity:");
}

id objc_msgSend_initWithAppInstallMemoryEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppInstallMemoryEntity:");
}

id objc_msgSend_initWithApplicationMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithApplicationMetadata:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributes:");
}

id objc_msgSend_initWithAvailableUpdateCount_shouldNotifyOfChanges_bundleIDs_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAvailableUpdateCount:shouldNotifyOfChanges:bundleIDs:result:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithBase64EncodedData_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedData:options:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase:");
}

id objc_msgSend_initWithBase_IDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase:IDs:");
}

id objc_msgSend_initWithBaseUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBaseUUID:");
}

id objc_msgSend_initWithBatchLogKey_logCode_externalID_bundleID_itemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBatchLogKey:logCode:externalID:bundleID:itemID:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundle:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBundleID_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleID_itemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:itemID:");
}

id objc_msgSend_initWithBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIDs:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithBundleIdentifierOfSystemPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifierOfSystemPlaceholder:error:");
}

id objc_msgSend_initWithBundlePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundlePath:");
}

id objc_msgSend_initWithBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleURL:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithBytesNoCopy_length_deallocator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:deallocator:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:");
}

id objc_msgSend_initWithCategory_base_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:base:");
}

id objc_msgSend_initWithCategory_baseUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:baseUUID:");
}

id objc_msgSend_initWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:");
}

id objc_msgSend_initWithCode_IDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:IDs:");
}

id objc_msgSend_initWithCode_base_ID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:base:ID:");
}

id objc_msgSend_initWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCondition:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:bag:");
}

id objc_msgSend_initWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithDSID_altDSID_username_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDSID:altDSID:username:options:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseEntity:properties:");
}

id objc_msgSend_initWithDatabaseID_propertyValues_externalPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseID:propertyValues:externalPropertyValues:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithDictionary_forAppAdamID_segment_hasFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:forAppAdamID:segment:hasFamily:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDouble:");
}

id objc_msgSend_initWithEndpoint_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEndpoint:parameters:");
}

id objc_msgSend_initWithEntity_package_finalPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:package:finalPhase:");
}

id objc_msgSend_initWithEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:");
}

id objc_msgSend_initWithExtension_queue_serviceTime_graceTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtension:queue:serviceTime:graceTime:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_locale_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:locale:arguments:");
}

id objc_msgSend_initWithGenre_genreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGenre:genreID:");
}

id objc_msgSend_initWithIAPs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIAPs:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:");
}

id objc_msgSend_initWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIndexesInRange:");
}

id objc_msgSend_initWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInteger:");
}

id objc_msgSend_initWithItemID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemID:error:");
}

id objc_msgSend_initWithItemIDs_additionalBuyParams_client_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemIDs:additionalBuyParams:client:logKey:");
}

id objc_msgSend_initWithItemIdentifer_externalVersionIdentifier_bundleIdentifier_bundleVersion_skipDownloads_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:");
}

id objc_msgSend_initWithItemMetadata_additionalBuyParams_client_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemMetadata:additionalBuyParams:client:logKey:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithKey_ascending_comparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:comparator:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_forClients_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:forClients:delegate:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_client_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:client:data:");
}

id objc_msgSend_initWithName_client_dictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:client:dictionary:");
}

id objc_msgSend_initWithName_client_diskSpaceNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:client:diskSpaceNeeded:");
}

id objc_msgSend_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithPath_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:options:");
}

id objc_msgSend_initWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:");
}

id objc_msgSend_initWithPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:onConnection:");
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:context:");
}

id objc_msgSend_initWithPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPropertyValues:");
}

id objc_msgSend_initWithPropertyValues_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPropertyValues:onConnection:");
}

id objc_msgSend_initWithPurchaseResponseItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurchaseResponseItems:");
}

id objc_msgSend_initWithPurchaseType_buyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurchaseType:buyParams:");
}

id objc_msgSend_initWithPurgeableSize_purgeableApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurgeableSize:purgeableApps:");
}

id objc_msgSend_initWithPurgedSize_purgedApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurgedSize:purgedApps:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithReason_requestToken_logKey_callbackHandler_includeMetrics_isVPPLookup_userInitiated_targetedItemID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRequest_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:bag:");
}

id objc_msgSend_initWithRequestID_promiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequestID:promiseBlock:");
}

id objc_msgSend_initWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResult:");
}

id objc_msgSend_initWithResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResults:");
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:duration:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:maxEvents:lastN:reversed:");
}

id objc_msgSend_initWithStoreItemIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreItemIdentifier:error:");
}

id objc_msgSend_initWithStoreRequestContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreRequestContext:");
}

id objc_msgSend_initWithStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStream:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuccess_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuccess:error:");
}

id objc_msgSend_initWithTask_metrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:metrics:");
}

id objc_msgSend_initWithTestFlightServiceHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestFlightServiceHost:");
}

id objc_msgSend_initWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeIntervalSinceNow:");
}

id objc_msgSend_initWithTimestamp_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:userInfo:");
}

id objc_msgSend_initWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:message:");
}

id objc_msgSend_initWithTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopic:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:clientIdentifier:clientVersion:bag:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUpdateDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUpdateDictionary:");
}

id objc_msgSend_initWithVolume_urgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVolume:urgency:");
}

id objc_msgSend_initialODRSize(void *a1, const char *a2, ...)
{
  return _[a1 initialODRSize];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installDate(void *a1, const char *a2, ...)
{
  return _[a1 installDate];
}

id objc_msgSend_installDatePropertyKey(void *a1, const char *a2, ...)
{
  return _[a1 installDatePropertyKey];
}

id objc_msgSend_installFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 installFailureReason];
}

id objc_msgSend_installForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installForBundleID:");
}

id objc_msgSend_installTotalUnitCount(void *a1, const char *a2, ...)
{
  return _[a1 installTotalUnitCount];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return _[a1 installType];
}

id objc_msgSend_installUniversalVariant(void *a1, const char *a2, ...)
{
  return _[a1 installUniversalVariant];
}

id objc_msgSend_installWithDuration_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installWithDuration:logKey:");
}

id objc_msgSend_installedExternalVersionID(void *a1, const char *a2, ...)
{
  return _[a1 installedExternalVersionID];
}

id objc_msgSend_installedVariantID(void *a1, const char *a2, ...)
{
  return _[a1 installedVariantID];
}

id objc_msgSend_installs(void *a1, const char *a2, ...)
{
  return _[a1 installs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intentUsageWithDateInterval_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intentUsageWithDateInterval:logKey:");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return _[a1 interfaceType];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateTokenForTopic_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateTokenForTopic:identifier:");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_is32BitOnly(void *a1, const char *a2, ...)
{
  return _[a1 is32BitOnly];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAppAnalyticsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAppAnalyticsAllowed];
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return _[a1 isAppClip];
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return _[a1 isAppStoreVendable];
}

id objc_msgSend_isAppleSigned(void *a1, const char *a2, ...)
{
  return _[a1 isAppleSigned];
}

id objc_msgSend_isArcade(void *a1, const char *a2, ...)
{
  return _[a1 isArcade];
}

id objc_msgSend_isArcadeApp(void *a1, const char *a2, ...)
{
  return _[a1 isArcadeApp];
}

id objc_msgSend_isAsynchronous(void *a1, const char *a2, ...)
{
  return _[a1 isAsynchronous];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAutomatic(void *a1, const char *a2, ...)
{
  return _[a1 isAutomatic];
}

id objc_msgSend_isAutomaticAppDownloadsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticAppDownloadsAllowed];
}

id objc_msgSend_isB2BCustomApp(void *a1, const char *a2, ...)
{
  return _[a1 isB2BCustomApp];
}

id objc_msgSend_isBackground(void *a1, const char *a2, ...)
{
  return _[a1 isBackground];
}

id objc_msgSend_isBackgroundRequest(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundRequest];
}

id objc_msgSend_isBackgroundUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundUpdate];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCandidateAppMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCandidateAppMetadata:");
}

id objc_msgSend_isCandidateAppProxy_isMetadataLookup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCandidateAppProxy:isMetadataLookup:");
}

id objc_msgSend_isCatalogFetchedWithinThePastFewDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCatalogFetchedWithinThePastFewDays:");
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _[a1 isComplete];
}

id objc_msgSend_isConfiguratorInstall(void *a1, const char *a2, ...)
{
  return _[a1 isConfiguratorInstall];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isConstrained(void *a1, const char *a2, ...)
{
  return _[a1 isConstrained];
}

id objc_msgSend_isDSIDLess(void *a1, const char *a2, ...)
{
  return _[a1 isDSIDLess];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return _[a1 isDeletable];
}

id objc_msgSend_isDeletableSystemApplication(void *a1, const char *a2, ...)
{
  return _[a1 isDeletableSystemApplication];
}

id objc_msgSend_isDeviceBasedVPP(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceBasedVPP];
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 isDiscretionary];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isExpensive(void *a1, const char *a2, ...)
{
  return _[a1 isExpensive];
}

id objc_msgSend_isExpensiveOrCellular(void *a1, const char *a2, ...)
{
  return _[a1 isExpensiveOrCellular];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return _[a1 isExpired];
}

id objc_msgSend_isFactoryInstall(void *a1, const char *a2, ...)
{
  return _[a1 isFactoryInstall];
}

id objc_msgSend_isFamilyShared(void *a1, const char *a2, ...)
{
  return _[a1 isFamilyShared];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isFirstParty(void *a1, const char *a2, ...)
{
  return _[a1 isFirstParty];
}

id objc_msgSend_isGameCenterEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isGameCenterEnabled];
}

id objc_msgSend_isHRNMode(void *a1, const char *a2, ...)
{
  return _[a1 isHRNMode];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHiddenFromSpringboard(void *a1, const char *a2, ...)
{
  return _[a1 isHiddenFromSpringboard];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return _[a1 isLaunchProhibited];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return _[a1 isLocal];
}

id objc_msgSend_isLocallyCacheable(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyCacheable];
}

id objc_msgSend_isMachineBased(void *a1, const char *a2, ...)
{
  return _[a1 isMachineBased];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isNegative(void *a1, const char *a2, ...)
{
  return _[a1 isNegative];
}

id objc_msgSend_isNotNullPredicateWithProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotNullPredicateWithProperty:");
}

id objc_msgSend_isNullPredicateWithProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNullPredicateWithProperty:");
}

id objc_msgSend_isOffloaded(void *a1, const char *a2, ...)
{
  return _[a1 isOffloaded];
}

id objc_msgSend_isPerDevice(void *a1, const char *a2, ...)
{
  return _[a1 isPerDevice];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isPreorder(void *a1, const char *a2, ...)
{
  return _[a1 isPreorder];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return _[a1 isProfileValidated];
}

id objc_msgSend_isProxy(void *a1, const char *a2, ...)
{
  return _[a1 isProxy];
}

id objc_msgSend_isPurchasedRedownload(void *a1, const char *a2, ...)
{
  return _[a1 isPurchasedRedownload];
}

id objc_msgSend_isRemoteInstall(void *a1, const char *a2, ...)
{
  return _[a1 isRemoteInstall];
}

id objc_msgSend_isRevoked(void *a1, const char *a2, ...)
{
  return _[a1 isRevoked];
}

id objc_msgSend_isRoaming(void *a1, const char *a2, ...)
{
  return _[a1 isRoaming];
}

id objc_msgSend_isStoreOriginated(void *a1, const char *a2, ...)
{
  return _[a1 isStoreOriginated];
}

id objc_msgSend_isTVProviderApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTVProviderApp:");
}

id objc_msgSend_isTVProviderApp_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTVProviderApp:withReplyHandler:");
}

id objc_msgSend_isTrialPeriod(void *a1, const char *a2, ...)
{
  return _[a1 isTrialPeriod];
}

id objc_msgSend_isUnrepairableAppWithItemID_externalVersionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnrepairableAppWithItemID:externalVersionID:");
}

id objc_msgSend_isUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isUpdate];
}

id objc_msgSend_isUserInitiated(void *a1, const char *a2, ...)
{
  return _[a1 isUserInitiated];
}

id objc_msgSend_isVPPLicensed(void *a1, const char *a2, ...)
{
  return _[a1 isVPPLicensed];
}

id objc_msgSend_isVPPLookup(void *a1, const char *a2, ...)
{
  return _[a1 isVPPLookup];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_isZipStreamable(void *a1, const char *a2, ...)
{
  return _[a1 isZipStreamable];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return _[a1 itemID];
}

id objc_msgSend_itemIDPropertyKey(void *a1, const char *a2, ...)
{
  return _[a1 itemIDPropertyKey];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 itemIdentifier];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return _[a1 itemName];
}

id objc_msgSend_itemResponse(void *a1, const char *a2, ...)
{
  return _[a1 itemResponse];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_jobResults(void *a1, const char *a2, ...)
{
  return _[a1 jobResults];
}

id objc_msgSend_joinClauseForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClauseForProperty:");
}

id objc_msgSend_keepAliveWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keepAliveWithFormat:");
}

id objc_msgSend_keepAliveWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keepAliveWithName:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return _[a1 keyPath];
}

id objc_msgSend_keyWithName_crossDeviceSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithName:crossDeviceSync:");
}

id objc_msgSend_keybagSyncDataWithAccountID_transactionType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keybagSyncDataWithAccountID:transactionType:error:");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_lastAutoPollDate(void *a1, const char *a2, ...)
{
  return _[a1 lastAutoPollDate];
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastModifiedDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastUserInitiatedInstall(void *a1, const char *a2, ...)
{
  return _[a1 lastUserInitiatedInstall];
}

id objc_msgSend_launchApp_extensionType_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchApp:extensionType:withResultHandler:");
}

id objc_msgSend_launchApp_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchApp:withResultHandler:");
}

id objc_msgSend_launchApplicationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchApplicationWithOptions:completionHandler:");
}

id objc_msgSend_launchProhibited(void *a1, const char *a2, ...)
{
  return _[a1 launchProhibited];
}

id objc_msgSend_launchReason(void *a1, const char *a2, ...)
{
  return _[a1 launchReason];
}

id objc_msgSend_launchURL(void *a1, const char *a2, ...)
{
  return _[a1 launchURL];
}

id objc_msgSend_leftExpression(void *a1, const char *a2, ...)
{
  return _[a1 leftExpression];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linearDownloadWithLogKey_metrics_throughputMin_throughputMax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linearDownloadWithLogKey:metrics:throughputMin:throughputMax:");
}

id objc_msgSend_loadURLEventPromiseWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadURLEventPromiseWithContext:");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_locateActionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locateActionWithIdentifier:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockWhenCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWhenCondition:");
}

id objc_msgSend_lockWhenCondition_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWhenCondition:beforeDate:");
}

id objc_msgSend_lockerItemID(void *a1, const char *a2, ...)
{
  return _[a1 lockerItemID];
}

id objc_msgSend_logCode(void *a1, const char *a2, ...)
{
  return _[a1 logCode];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _[a1 logKey];
}

id objc_msgSend_logStep_byParty_phase_success_forBundleID_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logStep:byParty:phase:success:forBundleID:description:");
}

id objc_msgSend_logUUID(void *a1, const char *a2, ...)
{
  return _[a1 logUUID];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longTitle(void *a1, const char *a2, ...)
{
  return _[a1 longTitle];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return _[a1 main];
}

id objc_msgSend_mainWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainWithCompletionHandler:");
}

id objc_msgSend_makeActivity(void *a1, const char *a2, ...)
{
  return _[a1 makeActivity];
}

id objc_msgSend_makeObjectsPerformSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:withObject:");
}

id objc_msgSend_managedAppBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 managedAppBundleIDs];
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return _[a1 manifest];
}

id objc_msgSend_manifestType(void *a1, const char *a2, ...)
{
  return _[a1 manifestType];
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return _[a1 manifestURL];
}

id objc_msgSend_matchesNull(void *a1, const char *a2, ...)
{
  return _[a1 matchesNull];
}

id objc_msgSend_md5(void *a1, const char *a2, ...)
{
  return _[a1 md5];
}

id objc_msgSend_mediaKind(void *a1, const char *a2, ...)
{
  return _[a1 mediaKind];
}

id objc_msgSend_memoryEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 memoryEntityClass];
}

id objc_msgSend_memoryEntityForPersistentID_withProperties_usingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memoryEntityForPersistentID:withProperties:usingConnection:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messagesArtworkURL(void *a1, const char *a2, ...)
{
  return _[a1 messagesArtworkURL];
}

id objc_msgSend_metadataFromPlistAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFromPlistAtURL:error:");
}

id objc_msgSend_metadataPropertyKey(void *a1, const char *a2, ...)
{
  return _[a1 metadataPropertyKey];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsFieldsFromResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsFieldsFromResult:");
}

id objc_msgSend_metricsOverlay(void *a1, const char *a2, ...)
{
  return _[a1 metricsOverlay];
}

id objc_msgSend_metricsOverlayWithPurchaseInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsOverlayWithPurchaseInfo:");
}

id objc_msgSend_metricsType(void *a1, const char *a2, ...)
{
  return _[a1 metricsType];
}

id objc_msgSend_migrateSubscriptionStateWithAccount_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSubscriptionStateWithAccount:logKey:");
}

id objc_msgSend_migrationType(void *a1, const char *a2, ...)
{
  return _[a1 migrationType];
}

id objc_msgSend_migratorType(void *a1, const char *a2, ...)
{
  return _[a1 migratorType];
}

id objc_msgSend_missingRequiredSINF(void *a1, const char *a2, ...)
{
  return _[a1 missingRequiredSINF];
}

id objc_msgSend_modifyUsingTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyUsingTransaction:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkConnectionType(void *a1, const char *a2, ...)
{
  return _[a1 networkConnectionType];
}

id objc_msgSend_networkConstraintsForMediaType_withBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkConstraintsForMediaType:withBag:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextOptimalDownloadWindowWithHour_minute_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextOptimalDownloadWindowWithHour:minute:duration:");
}

id objc_msgSend_noteUpdatesStateChanged_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteUpdatesStateChanged:logKey:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationCenter_didChangeSettings_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationCenter:didChangeSettings:bag:");
}

id objc_msgSend_notificationClient(void *a1, const char *a2, ...)
{
  return _[a1 notificationClient];
}

id objc_msgSend_notificationWithName_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationWithName:userInfo:");
}

id objc_msgSend_notifyDialogCompleteForPurchaseID_result_selectedButton_withResultHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDialogCompleteForPurchaseID:result:selectedButton:withResultHandler:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_nullIdentity(void *a1, const char *a2, ...)
{
  return _[a1 nullIdentity];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfBytesToHash(void *a1, const char *a2, ...)
{
  return _[a1 numberOfBytesToHash];
}

id objc_msgSend_numberOfMatchesInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfMatchesInString:options:range:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_odrEntitlementName(void *a1, const char *a2, ...)
{
  return _[a1 odrEntitlementName];
}

id objc_msgSend_odrServiceName(void *a1, const char *a2, ...)
{
  return _[a1 odrServiceName];
}

id objc_msgSend_offerID(void *a1, const char *a2, ...)
{
  return _[a1 offerID];
}

id objc_msgSend_offloadOnly(void *a1, const char *a2, ...)
{
  return _[a1 offloadOnly];
}

id objc_msgSend_onDemandResourceManifest(void *a1, const char *a2, ...)
{
  return _[a1 onDemandResourceManifest];
}

id objc_msgSend_onDeviceDiagnosticsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 onDeviceDiagnosticsAllowed];
}

id objc_msgSend_oneAccountDSID_logKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oneAccountDSID:logKey:completionHandler:");
}

id objc_msgSend_oneAccountDSIDWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oneAccountDSIDWithLogKey:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openApplicationWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleID:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_optedInForMacOSEligibility(void *a1, const char *a2, ...)
{
  return _[a1 optedInForMacOSEligibility];
}

id objc_msgSend_optedInForXROSEligibility(void *a1, const char *a2, ...)
{
  return _[a1 optedInForXROSEligibility];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_originalPurchaserDSID(void *a1, const char *a2, ...)
{
  return _[a1 originalPurchaserDSID];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _[a1 originalRequest];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _[a1 osVersion];
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_ovalIconURLString(void *a1, const char *a2, ...)
{
  return _[a1 ovalIconURLString];
}

id objc_msgSend_packageCompression(void *a1, const char *a2, ...)
{
  return _[a1 packageCompression];
}

id objc_msgSend_packageDPInfo(void *a1, const char *a2, ...)
{
  return _[a1 packageDPInfo];
}

id objc_msgSend_packageSINF(void *a1, const char *a2, ...)
{
  return _[a1 packageSINF];
}

id objc_msgSend_packageSize(void *a1, const char *a2, ...)
{
  return _[a1 packageSize];
}

id objc_msgSend_packageURL(void *a1, const char *a2, ...)
{
  return _[a1 packageURL];
}

id objc_msgSend_pairedWatchModel(void *a1, const char *a2, ...)
{
  return _[a1 pairedWatchModel];
}

id objc_msgSend_pairedWatchOSVersion(void *a1, const char *a2, ...)
{
  return _[a1 pairedWatchOSVersion];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return _[a1 pairingID];
}

id objc_msgSend_parameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterForKey:");
}

id objc_msgSend_parentalControlsName(void *a1, const char *a2, ...)
{
  return _[a1 parentalControlsName];
}

id objc_msgSend_parentalControlsRank(void *a1, const char *a2, ...)
{
  return _[a1 parentalControlsRank];
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return _[a1 parse];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathInfoWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathInfoWithURL:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pauseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseWithError:");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 performAuthentication];
}

id objc_msgSend_performBackgroundSoftwareUpdateCheck(void *a1, const char *a2, ...)
{
  return _[a1 performBackgroundSoftwareUpdateCheck];
}

id objc_msgSend_performPostRestoreUpdatesCheck(void *a1, const char *a2, ...)
{
  return _[a1 performPostRestoreUpdatesCheck];
}

id objc_msgSend_performSubscriptionStatusRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSubscriptionStatusRequest:withCompletionHandler:");
}

id objc_msgSend_performTaskWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithBlock:");
}

id objc_msgSend_persistenceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 persistenceIdentifier];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return _[a1 phase];
}

id objc_msgSend_placeholderEntitlements(void *a1, const char *a2, ...)
{
  return _[a1 placeholderEntitlements];
}

id objc_msgSend_placeholderFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 placeholderFailureReason];
}

id objc_msgSend_placeholderForRemovableSystemAppWithBundleID_client_installType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderForRemovableSystemAppWithBundleID:client:installType:error:");
}

id objc_msgSend_placeholderPromiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderPromiseWithError:");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _[a1 platform];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_postHashMismatchWithTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postHashMismatchWithTaskInfo:");
}

id objc_msgSend_postMetrics(void *a1, const char *a2, ...)
{
  return _[a1 postMetrics];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postProcessBackgroundUpdateMetrics(void *a1, const char *a2, ...)
{
  return _[a1 postProcessBackgroundUpdateMetrics];
}

id objc_msgSend_predicateFormat(void *a1, const char *a2, ...)
{
  return _[a1 predicateFormat];
}

id objc_msgSend_predicateMatchingAllPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAllPredicates:");
}

id objc_msgSend_predicateMatchingAnyPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAnyPredicates:");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateOperatorType(void *a1, const char *a2, ...)
{
  return _[a1 predicateOperatorType];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithProperty_equalToLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToLongLong:");
}

id objc_msgSend_predicateWithProperty_equalToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToValue:");
}

id objc_msgSend_predicateWithProperty_value_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:value:comparisonType:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _[a1 predicates];
}

id objc_msgSend_predictedOptimalStartDate(void *a1, const char *a2, ...)
{
  return _[a1 predictedOptimalStartDate];
}

id objc_msgSend_preflightPackageURL(void *a1, const char *a2, ...)
{
  return _[a1 preflightPackageURL];
}

id objc_msgSend_preflightWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightWithCompletion:");
}

id objc_msgSend_prepareForExtraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForExtraction:");
}

id objc_msgSend_prepareForExtractionToPath_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForExtractionToPath:completionBlock:");
}

id objc_msgSend_prepareWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareWithCompletionHandler:");
}

id objc_msgSend_prependingCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prependingCategory:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentAuthenticateRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAuthenticateRequest:resultHandler:");
}

id objc_msgSend_presentDialogRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDialogRequest:resultHandler:");
}

id objc_msgSend_presentEngagementRequest_withClientInfo_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentEngagementRequest:withClientInfo:resultHandler:");
}

id objc_msgSend_presentingSceneBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 presentingSceneBundleIdentifier];
}

id objc_msgSend_presentingSceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 presentingSceneIdentifier];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_privateInput(void *a1, const char *a2, ...)
{
  return _[a1 privateInput];
}

id objc_msgSend_processExists(void *a1, const char *a2, ...)
{
  return _[a1 processExists];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processPurchases_failBatchOnError_requestToken_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPurchases:failBatchOnError:requestToken:withReplyHandler:");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_productURL(void *a1, const char *a2, ...)
{
  return _[a1 productURL];
}

id objc_msgSend_productVariants(void *a1, const char *a2, ...)
{
  return _[a1 productVariants];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return _[a1 profile];
}

id objc_msgSend_profileVersion(void *a1, const char *a2, ...)
{
  return _[a1 profileVersion];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressWithTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "progressWithTotalUnitCount:");
}

id objc_msgSend_promiseAdapter(void *a1, const char *a2, ...)
{
  return _[a1 promiseAdapter];
}

id objc_msgSend_promiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithError:");
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return _[a1 property];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_propertyForKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:inRequest:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyValues(void *a1, const char *a2, ...)
{
  return _[a1 propertyValues];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return _[a1 proposedCredential];
}

id objc_msgSend_protectedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 protectedMetadata];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_provisioningProfiles(void *a1, const char *a2, ...)
{
  return _[a1 provisioningProfiles];
}

id objc_msgSend_proxyAppBundleID(void *a1, const char *a2, ...)
{
  return _[a1 proxyAppBundleID];
}

id objc_msgSend_proxyAppName(void *a1, const char *a2, ...)
{
  return _[a1 proxyAppName];
}

id objc_msgSend_proxyForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyForBundleID:");
}

id objc_msgSend_proxyForItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyForItemID:");
}

id objc_msgSend_publicErrorForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicErrorForError:");
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return _[a1 publicToken];
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherWithOptions:");
}

id objc_msgSend_purchase(void *a1, const char *a2, ...)
{
  return _[a1 purchase];
}

id objc_msgSend_purchaseDate(void *a1, const char *a2, ...)
{
  return _[a1 purchaseDate];
}

id objc_msgSend_purchaseID(void *a1, const char *a2, ...)
{
  return _[a1 purchaseID];
}

id objc_msgSend_purchaseInfoForUpdateUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseInfoForUpdateUserInitiated:");
}

id objc_msgSend_purchaseOnly(void *a1, const char *a2, ...)
{
  return _[a1 purchaseOnly];
}

id objc_msgSend_purchaseResponse(void *a1, const char *a2, ...)
{
  return _[a1 purchaseResponse];
}

id objc_msgSend_purchaseState(void *a1, const char *a2, ...)
{
  return _[a1 purchaseState];
}

id objc_msgSend_purchaseToken(void *a1, const char *a2, ...)
{
  return _[a1 purchaseToken];
}

id objc_msgSend_purchaseType(void *a1, const char *a2, ...)
{
  return _[a1 purchaseType];
}

id objc_msgSend_purchaserDSID(void *a1, const char *a2, ...)
{
  return _[a1 purchaserDSID];
}

id objc_msgSend_purchaserID(void *a1, const char *a2, ...)
{
  return _[a1 purchaserID];
}

id objc_msgSend_purchases(void *a1, const char *a2, ...)
{
  return _[a1 purchases];
}

id objc_msgSend_purgeForVolume_urgency_desiredPurge_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeForVolume:urgency:desiredPurge:client:");
}

id objc_msgSend_purgeableApps(void *a1, const char *a2, ...)
{
  return _[a1 purgeableApps];
}

id objc_msgSend_purgeableSize(void *a1, const char *a2, ...)
{
  return _[a1 purgeableSize];
}

id objc_msgSend_purgedApps(void *a1, const char *a2, ...)
{
  return _[a1 purgedApps];
}

id objc_msgSend_purgedSize(void *a1, const char *a2, ...)
{
  return _[a1 purgedSize];
}

id objc_msgSend_pushConnection_didReceiveRawMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushConnection:didReceiveRawMessage:");
}

id objc_msgSend_pushConnection_didReceiveToken_forTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushConnection:didReceiveToken:forTopic:");
}

id objc_msgSend_pushService_didReceiveMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushService:didReceiveMessage:completionHandler:");
}

id objc_msgSend_pushService_recoverFromDroppedMessagesOfActionType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushService:recoverFromDroppedMessagesOfActionType:completionHandler:");
}

id objc_msgSend_qosMetricsFields(void *a1, const char *a2, ...)
{
  return _[a1 qosMetricsFields];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_ratingLabel(void *a1, const char *a2, ...)
{
  return _[a1 ratingLabel];
}

id objc_msgSend_ratingRank(void *a1, const char *a2, ...)
{
  return _[a1 ratingRank];
}

id objc_msgSend_rawCriteria(void *a1, const char *a2, ...)
{
  return _[a1 rawCriteria];
}

id objc_msgSend_rawRegisteredName(void *a1, const char *a2, ...)
{
  return _[a1 rawRegisteredName];
}

id objc_msgSend_rawUpdateDictionary(void *a1, const char *a2, ...)
{
  return _[a1 rawUpdateDictionary];
}

id objc_msgSend_readBytes_length_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readBytes:length:error:");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readUsingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUsingSession:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_receipt(void *a1, const char *a2, ...)
{
  return _[a1 receipt];
}

id objc_msgSend_receiptFromBundleAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiptFromBundleAtPath:");
}

id objc_msgSend_receiptFromBundleAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiptFromBundleAtURL:");
}

id objc_msgSend_receiptURL(void *a1, const char *a2, ...)
{
  return _[a1 receiptURL];
}

id objc_msgSend_receiptWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiptWithData:");
}

id objc_msgSend_receiveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveMessage:");
}

id objc_msgSend_receiveResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveResponse:");
}

id objc_msgSend_receivesCredentialSecurely(void *a1, const char *a2, ...)
{
  return _[a1 receivesCredentialSecurely];
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _[a1 record];
}

id objc_msgSend_recordAppEventsForBundleIDs_eventType_installType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordAppEventsForBundleIDs:eventType:installType:");
}

id objc_msgSend_recordDeletedBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordDeletedBundleIDs:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordInstallEventsForBundleIDs_installType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordInstallEventsForBundleIDs:installType:");
}

id objc_msgSend_recordLaunches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordLaunches:");
}

id objc_msgSend_recordSupplementalAppMetricsEvents(void *a1, const char *a2, ...)
{
  return _[a1 recordSupplementalAppMetricsEvents];
}

id objc_msgSend_recoveryCount(void *a1, const char *a2, ...)
{
  return _[a1 recoveryCount];
}

id objc_msgSend_redownloadParams(void *a1, const char *a2, ...)
{
  return _[a1 redownloadParams];
}

id objc_msgSend_referrerName(void *a1, const char *a2, ...)
{
  return _[a1 referrerName];
}

id objc_msgSend_referrerURL(void *a1, const char *a2, ...)
{
  return _[a1 referrerURL];
}

id objc_msgSend_refreshInstallID(void *a1, const char *a2, ...)
{
  return _[a1 refreshInstallID];
}

id objc_msgSend_refreshUpdateCountWithRequestToken_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshUpdateCountWithRequestToken:replyHandler:");
}

id objc_msgSend_refreshUpdateForApp_token_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshUpdateForApp:token:replyHandler:");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerPaths_forBundleID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPaths:forBundleID:completionHandler:");
}

id objc_msgSend_registrationDate(void *a1, const char *a2, ...)
{
  return _[a1 registrationDate];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_relativeMetricsKeys(void *a1, const char *a2, ...)
{
  return _[a1 relativeMetricsKeys];
}

id objc_msgSend_relaunchOptions(void *a1, const char *a2, ...)
{
  return _[a1 relaunchOptions];
}

id objc_msgSend_releaseDate(void *a1, const char *a2, ...)
{
  return _[a1 releaseDate];
}

id objc_msgSend_reloadApplicationBadgeWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadApplicationBadgeWithReason:");
}

id objc_msgSend_reloadAppsFromServerWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAppsFromServerWithReply:");
}

id objc_msgSend_reloadFromDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromDatabaseEntity:properties:");
}

id objc_msgSend_reloadFromServerInBackgroundWithToken_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromServerInBackgroundWithToken:completionBlock:");
}

id objc_msgSend_reloadFromServerWithRequestToken_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromServerWithRequestToken:replyHandler:");
}

id objc_msgSend_reloadManagedUpdatesWithRequestToken_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadManagedUpdatesWithRequestToken:replyHandler:");
}

id objc_msgSend_reloadUpdatesWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadUpdatesWithContext:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removabilityForAppWithIdentity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removabilityForAppWithIdentity:completion:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeDeviceIdentifierForVendorName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeviceIdentifierForVendorName:bundleIdentifier:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePersistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePersistentDomainForName:");
}

id objc_msgSend_removePropertiesForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePropertiesForKeys:");
}

id objc_msgSend_removePropertyForKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePropertyForKey:inRequest:");
}

id objc_msgSend_removeStaleSubscriptionInfoWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStaleSubscriptionInfoWithLogKey:");
}

id objc_msgSend_repair_needsToReleaseBlockingCallerWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repair:needsToReleaseBlockingCallerWithReason:");
}

id objc_msgSend_repair_wantsToRelaunchApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repair:wantsToRelaunchApplication:");
}

id objc_msgSend_repairApplication_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairApplication:error:");
}

id objc_msgSend_repairType(void *a1, const char *a2, ...)
{
  return _[a1 repairType];
}

id objc_msgSend_repairedBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 repairedBundleIDs];
}

id objc_msgSend_reportRemotely(void *a1, const char *a2, ...)
{
  return _[a1 reportRemotely];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _[a1 requestID];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_requestPresenter(void *a1, const char *a2, ...)
{
  return _[a1 requestPresenter];
}

id objc_msgSend_requestStartDate(void *a1, const char *a2, ...)
{
  return _[a1 requestStartDate];
}

id objc_msgSend_requestToken(void *a1, const char *a2, ...)
{
  return _[a1 requestToken];
}

id objc_msgSend_requestTokenForTopic_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTokenForTopic:identifier:");
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return _[a1 requestType];
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_requestWithMethod_URL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:URL:parameters:");
}

id objc_msgSend_requestWithMethod_bagURL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:bagURL:parameters:");
}

id objc_msgSend_requestWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithTitle:message:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_requireUniversal(void *a1, const char *a2, ...)
{
  return _[a1 requireUniversal];
}

id objc_msgSend_requiredCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 requiredCapabilities];
}

id objc_msgSend_requiresPowerPluggedIn(void *a1, const char *a2, ...)
{
  return _[a1 requiresPowerPluggedIn];
}

id objc_msgSend_resetMetrics(void *a1, const char *a2, ...)
{
  return _[a1 resetMetrics];
}

id objc_msgSend_resetWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetWithCompletionHandler:");
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return _[a1 resignCurrent];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseCorrelationId(void *a1, const char *a2, ...)
{
  return _[a1 responseCorrelationId];
}

id objc_msgSend_responseDataItems(void *a1, const char *a2, ...)
{
  return _[a1 responseDataItems];
}

id objc_msgSend_responseDecoder(void *a1, const char *a2, ...)
{
  return _[a1 responseDecoder];
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 responseDictionary];
}

id objc_msgSend_responseEndDate(void *a1, const char *a2, ...)
{
  return _[a1 responseEndDate];
}

id objc_msgSend_responseStartDate(void *a1, const char *a2, ...)
{
  return _[a1 responseStartDate];
}

id objc_msgSend_responseStatusCode(void *a1, const char *a2, ...)
{
  return _[a1 responseStatusCode];
}

id objc_msgSend_restoringCoordinatorForBundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoringCoordinatorForBundleID:logKey:");
}

id objc_msgSend_resultWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithCompletion:");
}

id objc_msgSend_resultWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithError:");
}

id objc_msgSend_resultWithExistingActivity_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithExistingActivity:bundleID:");
}

id objc_msgSend_resultWithInvalidActivity_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithInvalidActivity:bundleID:");
}

id objc_msgSend_resultWithRestrictedActivity_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithRestrictedActivity:bundleID:");
}

id objc_msgSend_resultWithTimeout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithTimeout:error:");
}

id objc_msgSend_resultWithValidActivity_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithValidActivity:bundleID:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resultsMatchingPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsMatchingPredicate:error:");
}

id objc_msgSend_resultsWithBundleIDs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsWithBundleIDs:error:");
}

id objc_msgSend_resultsWithItemIDs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsWithItemIDs:error:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeWithError:");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rightExpression(void *a1, const char *a2, ...)
{
  return _[a1 rightExpression];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runSubTask_returningError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runSubTask:returningError:");
}

id objc_msgSend_runTaskReturningError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTaskReturningError:");
}

id objc_msgSend_scanInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanInteger:");
}

id objc_msgSend_scanString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanString:intoString:");
}

id objc_msgSend_scanUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUnsignedLongLong:");
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduleBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleBlock:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_screenHeight(void *a1, const char *a2, ...)
{
  return _[a1 screenHeight];
}

id objc_msgSend_screenWidth(void *a1, const char *a2, ...)
{
  return _[a1 screenWidth];
}

id objc_msgSend_searchTerm(void *a1, const char *a2, ...)
{
  return _[a1 searchTerm];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _[a1 secondsFromGMT];
}

id objc_msgSend_secondsFromGMTForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMTForDate:");
}

id objc_msgSend_secondsRemaining(void *a1, const char *a2, ...)
{
  return _[a1 secondsRemaining];
}

id objc_msgSend_segment(void *a1, const char *a2, ...)
{
  return _[a1 segment];
}

id objc_msgSend_selectedActionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 selectedActionIdentifier];
}

id objc_msgSend_sendLowDiskSpaceNotification(void *a1, const char *a2, ...)
{
  return _[a1 sendLowDiskSpaceNotification];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serializeLedger(void *a1, const char *a2, ...)
{
  return _[a1 serializeLedger];
}

id objc_msgSend_serverTimeFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverTimeFromDate:");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _[a1 serverTrust];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountID:");
}

id objc_msgSend_setAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountMediaType:");
}

id objc_msgSend_setAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdamId:");
}

id objc_msgSend_setAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalHeaders:");
}

id objc_msgSend_setAdditionalMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalMetrics:");
}

id objc_msgSend_setAdditionalQueryParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalQueryParams:");
}

id objc_msgSend_setAllowServerDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowServerDialogs:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsConstrainedNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsConstrainedNetworkAccess:");
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveAccess:");
}

id objc_msgSend_setAllowsExpensiveNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveNetworkAccess:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAlternateIconName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateIconName:");
}

id objc_msgSend_setAlwaysPreserved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysPreserved:");
}

id objc_msgSend_setAnisetteType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnisetteType:");
}

id objc_msgSend_setAnonymous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnonymous:");
}

id objc_msgSend_setAppAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAdamId:");
}

id objc_msgSend_setAppAssetPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAssetPromise:error:");
}

id objc_msgSend_setAppAssetPromiseResponsibleClient_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAssetPromiseResponsibleClient:error:");
}

id objc_msgSend_setAppPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppPlatform:");
}

id objc_msgSend_setAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppleID:");
}

id objc_msgSend_setApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApps:");
}

id objc_msgSend_setArcade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArcade:");
}

id objc_msgSend_setArcadeApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArcadeApp:");
}

id objc_msgSend_setArtistName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtistName:");
}

id objc_msgSend_setAuditTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuditTokenData:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setAutoRenewStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoRenewStatus:");
}

id objc_msgSend_setAutoUpdateEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoUpdateEnabled:");
}

id objc_msgSend_setAutoUpdateEnabled_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoUpdateEnabled:withReplyHandler:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setBatchLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchLogKey:");
}

id objc_msgSend_setBetaBuildGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBetaBuildGroupID:");
}

id objc_msgSend_setBetaExternalVersionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBetaExternalVersionIdentifier:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIDs:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifiers:");
}

id objc_msgSend_setBundlePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundlePath:");
}

id objc_msgSend_setBundleShortVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleShortVersion:");
}

id objc_msgSend_setBundleShortVersionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleShortVersionString:");
}

id objc_msgSend_setBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleURL:");
}

id objc_msgSend_setBundleVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleVersion:");
}

id objc_msgSend_setButtonActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonActions:");
}

id objc_msgSend_setBuyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuyParams:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setCachedSubscriptionEntitlements_forAccountID_segment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedSubscriptionEntitlements:forAccountID:segment:");
}

id objc_msgSend_setCanMakeAccountActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanMakeAccountActive:");
}

id objc_msgSend_setCanUseLocalCacheServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanUseLocalCacheServer:");
}

id objc_msgSend_setCancellationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancellationHandler:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCheckDiagnosticsAndUsageSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCheckDiagnosticsAndUsageSetting:");
}

id objc_msgSend_setCircularIconURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCircularIconURLString:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setClientType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientType:");
}

id objc_msgSend_setClientVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientVersion:");
}

id objc_msgSend_setCohort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCohort:");
}

id objc_msgSend_setCompanionBundleIdentifierForWatchApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompanionBundleIdentifierForWatchApp:");
}

id objc_msgSend_setComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComplete:");
}

id objc_msgSend_setCompleteDataPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompleteDataPromise:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompressRequestBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompressRequestBody:");
}

id objc_msgSend_setConfigurationCompleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationCompleteWithError:");
}

id objc_msgSend_setContentRatingFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentRatingFlags:");
}

id objc_msgSend_setCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoordinator:");
}

id objc_msgSend_setCoordinatorImportance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoordinatorImportance:");
}

id objc_msgSend_setCoordinatorIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoordinatorIntent:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCreateAsMobileBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateAsMobileBackup:");
}

id objc_msgSend_setCurrentlyOptedInForMacOSEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyOptedInForMacOSEligibility:");
}

id objc_msgSend_setCurrentlyOptedInForXROSEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlyOptedInForXROSEligibility:");
}

id objc_msgSend_setDSPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDSPersonID:");
}

id objc_msgSend_setDatabaseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseID:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDatePurchased_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatePurchased:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDebugReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugReason:");
}

id objc_msgSend_setDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultAction:");
}

id objc_msgSend_setDefaultButtonString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonString:");
}

id objc_msgSend_setDefaultValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultValue:forKey:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredPurgeAmount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredPurgeAmount:");
}

id objc_msgSend_setDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinations:");
}

id objc_msgSend_setDeveloperName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeveloperName:");
}

id objc_msgSend_setDeviceBasedVPP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceBasedVPP:");
}

id objc_msgSend_setDeviceSecurityPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceSecurityPromise:error:");
}

id objc_msgSend_setDeviceVendorID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceVendorID:");
}

id objc_msgSend_setDialogOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogOptions:");
}

id objc_msgSend_setDidShowPaymentSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidShowPaymentSheet:");
}

id objc_msgSend_setDisableBoosting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableBoosting:");
}

id objc_msgSend_setDiscoveredUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveredUpdate:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDoNotBlockOnNetworkStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockOnNetworkStatus:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setDownloadCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadCompletedUnitCount:");
}

id objc_msgSend_setDownloadTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadTotalUnitCount:");
}

id objc_msgSend_setDownloaderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloaderID:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnabledActionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledActionTypes:");
}

id objc_msgSend_setEnabledTopics_ignoredTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledTopics:ignoredTopics:");
}

id objc_msgSend_setEngagementPushTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngagementPushTopic:");
}

id objc_msgSend_setEnterpriseInstallURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnterpriseInstallURL:");
}

id objc_msgSend_setEntitlementsPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitlementsPromise:error:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorBlock:");
}

id objc_msgSend_setEventSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventSubtype:");
}

id objc_msgSend_setEventTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventTime:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setEvid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvid:");
}

id objc_msgSend_setExecutablePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutablePath:");
}

id objc_msgSend_setExitReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExitReason:");
}

id objc_msgSend_setExpectedSoftwarePlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedSoftwarePlatform:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtensions:");
}

id objc_msgSend_setExternalID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalID:");
}

id objc_msgSend_setExtractorDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtractorDelegate:");
}

id objc_msgSend_setFailureError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailureError:");
}

id objc_msgSend_setFairplayStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairplayStatus:");
}

id objc_msgSend_setFamilyID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyID:");
}

id objc_msgSend_setFamilyShared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyShared:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFirstParty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstParty:");
}

id objc_msgSend_setFlushDelayEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlushDelayEnabled:");
}

id objc_msgSend_setForceRevoke_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceRevoke:");
}

id objc_msgSend_setForceUpsell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceUpsell:");
}

id objc_msgSend_setForegroundUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundUsage:");
}

id objc_msgSend_setForegroundUsageEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundUsageEvents:");
}

id objc_msgSend_setGameCenterEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGameCenterEnabled:");
}

id objc_msgSend_setGameCenterEverEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGameCenterEverEnabled:");
}

id objc_msgSend_setGeneratedVendorID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratedVendorID:");
}

id objc_msgSend_setGenre_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenre:");
}

id objc_msgSend_setGenreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenreID:");
}

id objc_msgSend_setGenreName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenreName:");
}

id objc_msgSend_setHARLoggingItemLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHARLoggingItemLimit:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPContentType:");
}

id objc_msgSend_setHTTPCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieAcceptPolicy:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHTTPShouldHandleCookies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPShouldHandleCookies:");
}

id objc_msgSend_setHTTPShouldSetCookies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPShouldSetCookies:");
}

id objc_msgSend_setHTTPShouldUsePipelining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPShouldUsePipelining:");
}

id objc_msgSend_setHTTPUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPUserAgent:");
}

id objc_msgSend_setHasBeenPosted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenPosted:");
}

id objc_msgSend_setHasMessagesExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasMessagesExtension:");
}

id objc_msgSend_setHasOrEverHasHadIAP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasOrEverHasHadIAP:");
}

id objc_msgSend_setHasP3_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasP3:");
}

id objc_msgSend_setHasUsedFreeOffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasUsedFreeOffer:");
}

id objc_msgSend_setHasUsedIntroPricingOffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasUsedIntroPricingOffer:");
}

id objc_msgSend_setHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeader:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHiddenFromSpringboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHiddenFromSpringboard:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setIAdAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdAttribution:");
}

id objc_msgSend_setIAdConversionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdConversionDate:");
}

id objc_msgSend_setIAdImpressionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdImpressionDate:");
}

id objc_msgSend_setITunesMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesMetadata:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIconPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconPromise:error:");
}

id objc_msgSend_setIconURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconURLString:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreRequirePasswordRestriction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreRequirePasswordRestriction:");
}

id objc_msgSend_setImportance_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportance:error:");
}

id objc_msgSend_setIncludeAccountMatchStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeAccountMatchStatus:");
}

id objc_msgSend_setInitialODRAssetPromises_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialODRAssetPromises:error:");
}

id objc_msgSend_setInitialODRSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialODRSize:");
}

id objc_msgSend_setInstallCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallCompletedUnitCount:");
}

id objc_msgSend_setInstallDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallDate:");
}

id objc_msgSend_setInstallError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallError:");
}

id objc_msgSend_setInstallOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallOptions:error:");
}

id objc_msgSend_setInstallTargetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallTargetType:");
}

id objc_msgSend_setInstallTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallTotalUnitCount:");
}

id objc_msgSend_setInstalledExternalVersionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstalledExternalVersionID:");
}

id objc_msgSend_setInstalledVariantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstalledVariantID:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionLevel:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIs32BitOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIs32BitOnly:");
}

id objc_msgSend_setIsArcade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsArcade:");
}

id objc_msgSend_setIsAutoDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAutoDownload:");
}

id objc_msgSend_setIsB2BCustomApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsB2BCustomApp:");
}

id objc_msgSend_setIsBeta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBeta:");
}

id objc_msgSend_setIsFirstParty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFirstParty:");
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHidden:");
}

id objc_msgSend_setIsPreorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPreorder:");
}

id objc_msgSend_setItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemID:");
}

id objc_msgSend_setItemIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIdentifiers:");
}

id objc_msgSend_setItemName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemName:");
}

id objc_msgSend_setItemResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemResponse:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKind:");
}

id objc_msgSend_setLastModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastModifiedDate:");
}

id objc_msgSend_setLastUpdateCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUpdateCheck:");
}

id objc_msgSend_setLaunchProhibited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchProhibited:");
}

id objc_msgSend_setLaunchURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchURL:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLenient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLenient:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocalizedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedName:");
}

id objc_msgSend_setLockerItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockerItemID:");
}

id objc_msgSend_setLogCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogCode:");
}

id objc_msgSend_setLogDirectoryPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogDirectoryPath:");
}

id objc_msgSend_setLogFileBaseName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogFileBaseName:");
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogKey:");
}

id objc_msgSend_setLogUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogUUID:");
}

id objc_msgSend_setLongTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongTitle:");
}

id objc_msgSend_setLsRequiresPostProcessing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLsRequiresPostProcessing:");
}

id objc_msgSend_setMachineBased_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMachineBased:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setMaximumTerminationResistance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumTerminationResistance:");
}

id objc_msgSend_setMediaKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaKind:");
}

id objc_msgSend_setMescalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMescalType:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMetadata_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:error:");
}

id objc_msgSend_setMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetrics:");
}

id objc_msgSend_setMetricsOverlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsOverlay:");
}

id objc_msgSend_setMetricsType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsType:");
}

id objc_msgSend_setMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiplier:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNameTranscriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameTranscriptions:");
}

id objc_msgSend_setNextUpdateCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextUpdateCheck:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserver:");
}

id objc_msgSend_setOffloadOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffloadOnly:");
}

id objc_msgSend_setOptedInForMacOSEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptedInForMacOSEligibility:");
}

id objc_msgSend_setOptedInForXROSEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptedInForXROSEligibility:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOrderedBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderedBundleIDs:");
}

id objc_msgSend_setOriginalPurchaserDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalPurchaserDSID:");
}

id objc_msgSend_setOvalIconURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOvalIconURLString:");
}

id objc_msgSend_setOwnerAccountId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOwnerAccountId:");
}

id objc_msgSend_setPackageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPackageType:");
}

id objc_msgSend_setParameter_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParameter:forKey:");
}

id objc_msgSend_setPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPayload:");
}

id objc_msgSend_setPercentComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentComplete:");
}

id objc_msgSend_setPerformAvailablityCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerformAvailablityCheck:");
}

id objc_msgSend_setPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhase:");
}

id objc_msgSend_setPlaceholderAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderAttributes:error:");
}

id objc_msgSend_setPlaceholderPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderPromise:error:");
}

id objc_msgSend_setPollTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPollTime:");
}

id objc_msgSend_setPosted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosted:");
}

id objc_msgSend_setPreflightPackageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreflightPackageURL:");
}

id objc_msgSend_setPreparationPromise_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreparationPromise:withError:");
}

id objc_msgSend_setPresentingSceneBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingSceneBundleIdentifier:");
}

id objc_msgSend_setPresentingSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingSceneIdentifier:");
}

id objc_msgSend_setPreservationPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservationPriority:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPrivateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivateDelegate:");
}

id objc_msgSend_setProductURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductURL:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setPromptTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptTitle:");
}

id objc_msgSend_setProperty_forBodyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forBodyKey:");
}

id objc_msgSend_setProperty_forKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:inRequest:");
}

id objc_msgSend_setProtocolClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolClasses:");
}

id objc_msgSend_setProtocolHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolHandler:");
}

id objc_msgSend_setProvisioningProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvisioningProfiles:");
}

id objc_msgSend_setProxyAppBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyAppBundleID:");
}

id objc_msgSend_setProxyAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyAppName:");
}

id objc_msgSend_setPurchase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchase:");
}

id objc_msgSend_setPurchaseAccountFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseAccountFallback:");
}

id objc_msgSend_setPurchaseDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseDate:");
}

id objc_msgSend_setPurchaseOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseOnly:");
}

id objc_msgSend_setPurchaseState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseState:");
}

id objc_msgSend_setPurchaseToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseToken:");
}

id objc_msgSend_setPurchaseType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseType:");
}

id objc_msgSend_setPurchasedRedownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchasedRedownload:");
}

id objc_msgSend_setPurchaserDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaserDSID:");
}

id objc_msgSend_setPurchaserID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaserID:");
}

id objc_msgSend_setPurgeableReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurgeableReason:");
}

id objc_msgSend_setPurgeableType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurgeableType:");
}

id objc_msgSend_setQosMetricsFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQosMetricsFields:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRatingLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRatingLabel:");
}

id objc_msgSend_setRatingRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRatingRank:");
}

id objc_msgSend_setRawUpdateData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawUpdateData:");
}

id objc_msgSend_setRawUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawUpdateState:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRecoveryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecoveryCount:");
}

id objc_msgSend_setRedownloadParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedownloadParams:");
}

id objc_msgSend_setReferrerApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferrerApp:");
}

id objc_msgSend_setReferrerURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferrerURL:");
}

id objc_msgSend_setRefreshInstallID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshInstallID:");
}

id objc_msgSend_setReleaseDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReleaseDate:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteProgress:");
}

id objc_msgSend_setReportRemotely_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportRemotely:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setRequestEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestEncoding:");
}

id objc_msgSend_setRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestIdentifier:");
}

id objc_msgSend_setRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestToken:");
}

id objc_msgSend_setRequireUniversal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequireUniversal:");
}

id objc_msgSend_setRequiredCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiredCapabilities:");
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPowerPluggedIn:");
}

id objc_msgSend_setResourceValues_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceValues:error:");
}

id objc_msgSend_setResponseDecoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseDecoder:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSendBlindedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendBlindedData:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setShortItemName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortItemName:");
}

id objc_msgSend_setShortVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortVersion:");
}

id objc_msgSend_setShouldBackgroundDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldBackgroundDefaultAction:");
}

id objc_msgSend_setShouldCollectMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCollectMetrics:");
}

id objc_msgSend_setShouldCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCopy:");
}

id objc_msgSend_setShouldReturnLastKnownStatusOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldReturnLastKnownStatusOnly:");
}

id objc_msgSend_setSinfData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSinfData:");
}

id objc_msgSend_setSkipLaunchCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkipLaunchCheck:");
}

id objc_msgSend_setSoftwareVersionBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoftwareVersionBundleID:");
}

id objc_msgSend_setSoftwareVersionExternalIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoftwareVersionExternalIdentifier:");
}

id objc_msgSend_setSourceApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceApp:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStaticDiskUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticDiskUsage:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStatusCondition_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusCondition:completionHandler:");
}

id objc_msgSend_setStoreCohort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreCohort:");
}

id objc_msgSend_setStoreExternalVersionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreExternalVersionID:");
}

id objc_msgSend_setStoreFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreFront:");
}

id objc_msgSend_setStoreIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreIDs:");
}

id objc_msgSend_setStoreItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreItemID:");
}

id objc_msgSend_setStorefront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefront:");
}

id objc_msgSend_setStorefrontCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefrontCountryCode:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubGenres_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubGenres:");
}

id objc_msgSend_setSubscriptionFamilyId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionFamilyId:");
}

id objc_msgSend_setSupportsIPad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsIPad:");
}

id objc_msgSend_setSupportsIPhone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsIPhone:");
}

id objc_msgSend_setSupportsLayeredImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsLayeredImage:");
}

id objc_msgSend_setSupportsMac_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsMac:");
}

id objc_msgSend_setSupportsRealityDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRealityDevice:");
}

id objc_msgSend_setSuppressDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressDialogs:");
}

id objc_msgSend_setSuppressEvaluatorDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressEvaluatorDialogs:");
}

id objc_msgSend_setSyncGracePeriodMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncGracePeriodMinutes:");
}

id objc_msgSend_setSyncIntervalMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncIntervalMinutes:");
}

id objc_msgSend_setSystemAppInstall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemAppInstall:");
}

id objc_msgSend_setTargetGizmoPairingID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetGizmoPairingID:error:");
}

id objc_msgSend_setTemporaryBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemporaryBundleID:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setThroughput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThroughput:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalUnitCount:");
}

id objc_msgSend_setTransferPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransferPath:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUiDeviceFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUiDeviceFamily:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:");
}

id objc_msgSend_setUpdateBuyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBuyParams:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpdateInstallDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateInstallDate:");
}

id objc_msgSend_setUpdateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateState:");
}

id objc_msgSend_setUpdateType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateType:");
}

id objc_msgSend_setUrlKnownToBeTrusted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlKnownToBeTrusted:");
}

id objc_msgSend_setUseJSONContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseJSONContentType:");
}

id objc_msgSend_setUseLocalAuthAndInteractiveDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseLocalAuthAndInteractiveDialogs:");
}

id objc_msgSend_setUseLocalAuthAndSystemDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseLocalAuthAndSystemDialogs:");
}

id objc_msgSend_setUserDataPromise_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDataPromise:error:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInfoObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfoObject:forKey:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setUserNotificationExtensionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserNotificationExtensionId:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setUsingModernUpdatesCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsingModernUpdatesCheck:");
}

id objc_msgSend_setValue_forExternalProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forExternalProperty:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forProperty:");
}

id objc_msgSend_setValues_forExternalProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forExternalProperties:count:");
}

id objc_msgSend_setValues_forProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forProperties:count:");
}

id objc_msgSend_setValuesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesWithDictionary:");
}

id objc_msgSend_setVariantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVariantID:");
}

id objc_msgSend_setVendorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVendorName:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _[a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setWatchAppDeliveredIniOSApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWatchAppDeliveredIniOSApp:");
}

id objc_msgSend_setWatchAppRunsIndependently_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWatchAppRunsIndependently:");
}

id objc_msgSend_setWatchApplicationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWatchApplicationMode:");
}

id objc_msgSend_setWatchOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWatchOnly:");
}

id objc_msgSend_setWeekOfYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeekOfYear:");
}

id objc_msgSend_setWeekStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeekStartDate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_atsContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_atsContext:");
}

id objc_msgSend_set_bytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_bytesPerSecondLimit:");
}

id objc_msgSend_set_connectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionCachePurgeTimeout:");
}

id objc_msgSend_set_connectionPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionPoolName:");
}

id objc_msgSend_set_infersDiscretionaryFromOriginatingClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:");
}

id objc_msgSend_set_loadingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_loadingPriority:");
}

id objc_msgSend_set_longLivedConnectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_longLivedConnectionCachePurgeTimeout:");
}

id objc_msgSend_set_nw_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_nw_activity:");
}

id objc_msgSend_set_preventsIdleSleepOnceConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preventsIdleSleepOnceConnected:");
}

id objc_msgSend_set_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_priority:");
}

id objc_msgSend_set_requiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresPowerPluggedIn:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:");
}

id objc_msgSend_set_suppressedAutoAddedHTTPHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_suppressedAutoAddedHTTPHeaders:");
}

id objc_msgSend_set_timingDataOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_timingDataOptions:");
}

id objc_msgSend_settingsForIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForIdentity:");
}

id objc_msgSend_setupFollowingMigration(void *a1, const char *a2, ...)
{
  return _[a1 setupFollowingMigration];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedCenter(void *a1, const char *a2, ...)
{
  return _[a1 sharedCenter];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedDatabaseContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedDatabaseContext];
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return _[a1 sharedDefaultEvaluator];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_sharedStatusController(void *a1, const char *a2, ...)
{
  return _[a1 sharedStatusController];
}

id objc_msgSend_shortVersion(void *a1, const char *a2, ...)
{
  return _[a1 shortVersion];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 shortVersionString];
}

id objc_msgSend_shouldAttemptToRepairApplication_options_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAttemptToRepairApplication:options:logKey:");
}

id objc_msgSend_shouldCollectMetrics(void *a1, const char *a2, ...)
{
  return _[a1 shouldCollectMetrics];
}

id objc_msgSend_shouldCollectMetricsPromiseForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCollectMetricsPromiseForContext:");
}

id objc_msgSend_shouldEnableSystemAppsForAppUsageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEnableSystemAppsForAppUsageType:");
}

id objc_msgSend_shouldFilterExternalOriginatedDownloads(void *a1, const char *a2, ...)
{
  return _[a1 shouldFilterExternalOriginatedDownloads];
}

id objc_msgSend_shouldHandleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleNotification:");
}

id objc_msgSend_shouldHandleNotificationResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleNotificationResponse:");
}

id objc_msgSend_shouldHideUserPrompts(void *a1, const char *a2, ...)
{
  return _[a1 shouldHideUserPrompts];
}

id objc_msgSend_shouldPerformUpdates(void *a1, const char *a2, ...)
{
  return _[a1 shouldPerformUpdates];
}

id objc_msgSend_shouldReportDownloadProgress(void *a1, const char *a2, ...)
{
  return _[a1 shouldReportDownloadProgress];
}

id objc_msgSend_shouldUseModernUpdates(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseModernUpdates];
}

id objc_msgSend_showPendingUpdatesBadge(void *a1, const char *a2, ...)
{
  return _[a1 showPendingUpdatesBadge];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return _[a1 signpostID];
}

id objc_msgSend_sinf(void *a1, const char *a2, ...)
{
  return _[a1 sinf];
}

id objc_msgSend_sinfs(void *a1, const char *a2, ...)
{
  return _[a1 sinfs];
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_sizeLimitForNetworkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeLimitForNetworkType:");
}

id objc_msgSend_skipCoordinatorCompletion(void *a1, const char *a2, ...)
{
  return _[a1 skipCoordinatorCompletion];
}

id objc_msgSend_skipDownloads(void *a1, const char *a2, ...)
{
  return _[a1 skipDownloads];
}

id objc_msgSend_skipLaunchCheck(void *a1, const char *a2, ...)
{
  return _[a1 skipLaunchCheck];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_softwarePlatform(void *a1, const char *a2, ...)
{
  return _[a1 softwarePlatform];
}

id objc_msgSend_softwareVersionBundleID(void *a1, const char *a2, ...)
{
  return _[a1 softwareVersionBundleID];
}

id objc_msgSend_softwareVersionExternalIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 softwareVersionExternalIdentifier];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortOptions(void *a1, const char *a2, ...)
{
  return _[a1 sortOptions];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAccessingReturningError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAccessingReturningError:");
}

id objc_msgSend_startCatalogDownload_options_completionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:options:completionWithError:");
}

id objc_msgSend_startContainerWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startContainerWithCode:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startInstallIDs_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startInstallIDs:transaction:");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_startPostProcessingForID_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPostProcessingForID:transaction:");
}

id objc_msgSend_startUsingProxy_withErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUsingProxy:withErrorHandler:");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return _[a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return _[a1 staticUsage];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusType(void *a1, const char *a2, ...)
{
  return _[a1 statusType];
}

id objc_msgSend_stopAccessing(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessing];
}

id objc_msgSend_stopInstallID_withReason_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopInstallID:withReason:transaction:");
}

id objc_msgSend_storeAccountID(void *a1, const char *a2, ...)
{
  return _[a1 storeAccountID];
}

id objc_msgSend_storeAccountName(void *a1, const char *a2, ...)
{
  return _[a1 storeAccountName];
}

id objc_msgSend_storeCohort(void *a1, const char *a2, ...)
{
  return _[a1 storeCohort];
}

id objc_msgSend_storeDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 storeDescriptor];
}

id objc_msgSend_storeExternalVersionID(void *a1, const char *a2, ...)
{
  return _[a1 storeExternalVersionID];
}

id objc_msgSend_storeFront(void *a1, const char *a2, ...)
{
  return _[a1 storeFront];
}

id objc_msgSend_storeIDs(void *a1, const char *a2, ...)
{
  return _[a1 storeIDs];
}

id objc_msgSend_storeItemID(void *a1, const char *a2, ...)
{
  return _[a1 storeItemID];
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeItemIdentifier];
}

id objc_msgSend_storeMetadata(void *a1, const char *a2, ...)
{
  return _[a1 storeMetadata];
}

id objc_msgSend_storeTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 storeTransactionID];
}

id objc_msgSend_storefront(void *a1, const char *a2, ...)
{
  return _[a1 storefront];
}

id objc_msgSend_storefrontID(void *a1, const char *a2, ...)
{
  return _[a1 storefrontID];
}

id objc_msgSend_stream_handleEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stream:handleEvent:");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return _[a1 streamStatus];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromByteCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subGenres(void *a1, const char *a2, ...)
{
  return _[a1 subGenres];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_submittedActivities(void *a1, const char *a2, ...)
{
  return _[a1 submittedActivities];
}

id objc_msgSend_subpredicates(void *a1, const char *a2, ...)
{
  return _[a1 subpredicates];
}

id objc_msgSend_subscriptionFamilyId(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionFamilyId];
}

id objc_msgSend_subscriptionInfoDictionaryWithAccount_onlyReturnForPreviouslySubscribedAccount_logKey_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionInfoDictionaryWithAccount:onlyReturnForPreviouslySubscribedAccount:logKey:");
}

id objc_msgSend_subscriptionStatus(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionStatus];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _[a1 success];
}

id objc_msgSend_supplyBytes_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supplyBytes:withCompletionBlock:");
}

id objc_msgSend_supportedDialogHandlers(void *a1, const char *a2, ...)
{
  return _[a1 supportedDialogHandlers];
}

id objc_msgSend_supportsIPad(void *a1, const char *a2, ...)
{
  return _[a1 supportsIPad];
}

id objc_msgSend_supportsIPhone(void *a1, const char *a2, ...)
{
  return _[a1 supportsIPhone];
}

id objc_msgSend_supportsLayeredImage(void *a1, const char *a2, ...)
{
  return _[a1 supportsLayeredImage];
}

id objc_msgSend_supportsMac(void *a1, const char *a2, ...)
{
  return _[a1 supportsMac];
}

id objc_msgSend_supportsRealityDevice(void *a1, const char *a2, ...)
{
  return _[a1 supportsRealityDevice];
}

id objc_msgSend_suppressDialogs(void *a1, const char *a2, ...)
{
  return _[a1 suppressDialogs];
}

id objc_msgSend_suppressEvaluatorDialogs(void *a1, const char *a2, ...)
{
  return _[a1 suppressEvaluatorDialogs];
}

id objc_msgSend_suspendStreamWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendStreamWithCompletionBlock:");
}

id objc_msgSend_suspendWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendWithCompletionHandler:");
}

id objc_msgSend_syncGracePeriodMinutes(void *a1, const char *a2, ...)
{
  return _[a1 syncGracePeriodMinutes];
}

id objc_msgSend_syncIfNeededWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncIfNeededWithLogKey:");
}

id objc_msgSend_syncIntervalMinutes(void *a1, const char *a2, ...)
{
  return _[a1 syncIntervalMinutes];
}

id objc_msgSend_syncLaunchesWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncLaunchesWithLogKey:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_takeSample(void *a1, const char *a2, ...)
{
  return _[a1 takeSample];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_temporaryBundleID(void *a1, const char *a2, ...)
{
  return _[a1 temporaryBundleID];
}

id objc_msgSend_terminateApplication_forReason_andReport_withDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateApplication:forReason:andReport:withDescription:");
}

id objc_msgSend_testFlightConsumer_didChangeStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testFlightConsumer:didChangeStatus:");
}

id objc_msgSend_testFlightServiceExtensionCustomServiceTime(void *a1, const char *a2, ...)
{
  return _[a1 testFlightServiceExtensionCustomServiceTime];
}

id objc_msgSend_testFlightServiceHost_didUpdateExtensionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testFlightServiceHost:didUpdateExtensionStatus:");
}

id objc_msgSend_textFieldWithPlaceholder_secure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldWithPlaceholder:secure:");
}

id objc_msgSend_textfieldValues(void *a1, const char *a2, ...)
{
  return _[a1 textfieldValues];
}

id objc_msgSend_thenPerform_orCatchError_onScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenPerform:orCatchError:onScheduler:");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_thinningVariantID(void *a1, const char *a2, ...)
{
  return _[a1 thinningVariantID];
}

id objc_msgSend_throughput(void *a1, const char *a2, ...)
{
  return _[a1 throughput];
}

id objc_msgSend_thumbnailURL(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailURL];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _[a1 timeZone];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return _[a1 timeoutInterval];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return _[a1 totalUnitCount];
}

id objc_msgSend_transactionMetrics(void *a1, const char *a2, ...)
{
  return _[a1 transactionMetrics];
}

id objc_msgSend_transformWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformWithBlock:");
}

id objc_msgSend_truncateAtOffset_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truncateAtOffset:error:");
}

id objc_msgSend_truncateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truncateWithCompletionHandler:");
}

id objc_msgSend_tryLockWhenCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryLockWhenCondition:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return _[a1 typeForInstallMachinery];
}

id objc_msgSend_typeForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeForURL:");
}

id objc_msgSend_typeWithMIMEType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithMIMEType:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_underlyingDictionary(void *a1, const char *a2, ...)
{
  return _[a1 underlyingDictionary];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return _[a1 underlyingErrors];
}

id objc_msgSend_uninstallApp_requestUserConfirmation_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uninstallApp:requestUserConfirmation:withResultHandler:");
}

id objc_msgSend_uninstallAppWithBundleID_requestUserConfirmation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uninstallAppWithBundleID:requestUserConfirmation:completion:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unregisterURLs_forBundleID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterURLs:forBundleID:completionHandler:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateAllWithOrder_requestToken_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllWithOrder:requestToken:replyHandler:");
}

id objc_msgSend_updateGeneratedProperties(void *a1, const char *a2, ...)
{
  return _[a1 updateGeneratedProperties];
}

id objc_msgSend_updateLogKey(void *a1, const char *a2, ...)
{
  return _[a1 updateLogKey];
}

id objc_msgSend_updateSINFForAppWithIdentity_sinfData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSINFForAppWithIdentity:sinfData:options:error:");
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return _[a1 updateState];
}

id objc_msgSend_updateStatePropertyKey(void *a1, const char *a2, ...)
{
  return _[a1 updateStatePropertyKey];
}

id objc_msgSend_updateSubscriptionInfoWithEntitlement_account_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionInfoWithEntitlement:account:logKey:");
}

id objc_msgSend_updateType(void *a1, const char *a2, ...)
{
  return _[a1 updateType];
}

id objc_msgSend_updateiTunesMetadataForAppWithIdentity_plistData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateiTunesMetadataForAppWithIdentity:plistData:options:error:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_urgency(void *a1, const char *a2, ...)
{
  return _[a1 urgency];
}

id objc_msgSend_useJSONContentType(void *a1, const char *a2, ...)
{
  return _[a1 useJSONContentType];
}

id objc_msgSend_useLocalAuthAndInteractiveDialogs(void *a1, const char *a2, ...)
{
  return _[a1 useLocalAuthAndInteractiveDialogs];
}

id objc_msgSend_useLocalAuthAndSystemDialogs(void *a1, const char *a2, ...)
{
  return _[a1 useLocalAuthAndSystemDialogs];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _[a1 user];
}

id objc_msgSend_userAgentForProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAgentForProcessInfo:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return _[a1 userInitiated];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_usesInterfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesInterfaceType:");
}

id objc_msgSend_validLocationProxy(void *a1, const char *a2, ...)
{
  return _[a1 validLocationProxy];
}

id objc_msgSend_validateEligibilityForUpdatesWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateEligibilityForUpdatesWithLogKey:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForExternalProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForExternalProperty:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valuePromise(void *a1, const char *a2, ...)
{
  return _[a1 valuePromise];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithError:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_variantID(void *a1, const char *a2, ...)
{
  return _[a1 variantID];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return _[a1 vendorName];
}

id objc_msgSend_verifyAllPendingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 verifyAllPendingUpdates];
}

id objc_msgSend_verifyPendingUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPendingUpdates:");
}

id objc_msgSend_verifyUpdatesFollowingExternalAppInstall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyUpdatesFollowingExternalAppInstall:");
}

id objc_msgSend_versionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 versionIdentifier];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _[a1 volume];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_waitUntilFinishedWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitUntilFinishedWithTimeout:");
}

id objc_msgSend_watchAppDeliveredIniOSApp(void *a1, const char *a2, ...)
{
  return _[a1 watchAppDeliveredIniOSApp];
}

id objc_msgSend_watchAppRunsIndependently(void *a1, const char *a2, ...)
{
  return _[a1 watchAppRunsIndependently];
}

id objc_msgSend_watchOnly(void *a1, const char *a2, ...)
{
  return _[a1 watchOnly];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeString_withCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeString:withCode:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_writeUInt32_withCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt32:withCode:");
}

id objc_msgSend_writeUInt64_withCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt64:withCode:");
}

id objc_msgSend_writeUInt8_withCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt8:withCode:");
}