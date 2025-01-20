@interface UPUpdateProfileRequest
+ (BOOL)_pb_sanitizeUpdateUserProfileAttributes:(id)a3;
+ (id)pb_updateProfileRequestWithUserProfileIdentifier:(id)a3 attributes:(id)a4 error:(id *)a5;
@end

@implementation UPUpdateProfileRequest

+ (id)pb_updateProfileRequestWithUserProfileIdentifier:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  Class v11 = NSClassFromString(@"NSString");
  if (!v10)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289A18();
    }
LABEL_72:
    _bs_set_crash_log_message([v78 UTF8String]);
    __break(0);
    JUMPOUT(0x100192B88LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289A18();
    }
    _bs_set_crash_log_message([v79 UTF8String]);
    __break(0);
    JUMPOUT(0x100192BECLL);
  }

  id v12 = v9;
  Class v13 = NSClassFromString(@"PBSUpdateUserProfileAttributes");
  if (!v12)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289AB8();
    }
    _bs_set_crash_log_message([v80 UTF8String]);
    __break(0);
    JUMPOUT(0x100192C50LL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSUpdateUserProfileAttributesClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289AB8();
    }
    goto LABEL_72;
  }

  if (objc_msgSend(a1, "_pb_sanitizeUpdateUserProfileAttributes:", v12))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UPProfilePredicate predicateForSystemAppUserIdentifier:]( &OBJC_CLASS___UPProfilePredicate,  "predicateForSystemAppUserIdentifier:",  v10));
    v15 = -[UPUpdateProfileRequest initWithPredicate:]( objc_alloc(&OBJC_CLASS___UPUpdateProfileRequest),  "initWithPredicate:",  v14);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudAltDSID]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudAltDSID]);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
      id v20 = v18;
      v21 = v20;
      if (v19)
      {
        if ((objc_opt_isKindOfClass(v20, v19) & 1) != 0) {
          v22 = v21;
        }
        else {
          v22 = 0LL;
        }
      }

      else
      {
        v22 = 0LL;
      }

      id v32 = v22;

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updateiCloudAltDSIDRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updateiCloudAltDSIDRequest:",  v32));
      -[NSMutableArray addObject:](v16, "addObject:", v33);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v12 iTunesAltDSID]);

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v12 iTunesAltDSID]);
      uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString);
      id v37 = v35;
      v38 = v37;
      if (v36)
      {
        if ((objc_opt_isKindOfClass(v37, v36) & 1) != 0) {
          v39 = v38;
        }
        else {
          v39 = 0LL;
        }
      }

      else
      {
        v39 = 0LL;
      }

      id v40 = v39;

      v41 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updateiTunesAltDSIDRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updateiTunesAltDSIDRequest:",  v40));
      -[NSMutableArray addObject:](v16, "addObject:", v41);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue([v12 gameCenterAltDSID]);

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v12 gameCenterAltDSID]);
      uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSString);
      id v45 = v43;
      v46 = v45;
      if (v44)
      {
        if ((objc_opt_isKindOfClass(v45, v44) & 1) != 0) {
          v47 = v46;
        }
        else {
          v47 = 0LL;
        }
      }

      else
      {
        v47 = 0LL;
      }

      id v48 = v47;

      v49 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updateGameCenterAltDSIDRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updateGameCenterAltDSIDRequest:",  v48));
      -[NSMutableArray addObject:](v16, "addObject:", v49);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue([v12 overrideName]);

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue([v12 overrideName]);
      uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString);
      id v53 = v51;
      v54 = v53;
      if (v52)
      {
        if ((objc_opt_isKindOfClass(v53, v52) & 1) != 0) {
          v55 = v54;
        }
        else {
          v55 = 0LL;
        }
      }

      else
      {
        v55 = 0LL;
      }

      id v56 = v55;

      v57 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updateCustomNameRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updateCustomNameRequest:",  v56));
      -[NSMutableArray addObject:](v16, "addObject:", v57);
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredLanguages]);

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredLanguages]);
      uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v61 = v59;
      v62 = v61;
      if (v60)
      {
        if ((objc_opt_isKindOfClass(v61, v60) & 1) != 0) {
          v63 = v62;
        }
        else {
          v63 = 0LL;
        }
      }

      else
      {
        v63 = 0LL;
      }

      id v64 = v63;

      if (v64) {
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v64));
      }
      else {
        v65 = 0LL;
      }
      v66 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updatePreferredLanguagesRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updatePreferredLanguagesRequest:",  v65));
      -[NSMutableArray addObject:](v16, "addObject:", v66);
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredInputModes]);

    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredInputModes]);
      uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v70 = v68;
      v71 = v70;
      if (v69)
      {
        if ((objc_opt_isKindOfClass(v70, v69) & 1) != 0) {
          v72 = v71;
        }
        else {
          v72 = 0LL;
        }
      }

      else
      {
        v72 = 0LL;
      }

      id v73 = v72;

      if (v73) {
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v73));
      }
      else {
        v74 = 0LL;
      }
      v75 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileMetadataRequest updatePreferredInputModesRequest:]( &OBJC_CLASS___UPUpdateProfileMetadataRequest,  "updatePreferredInputModesRequest:",  v74));
      -[NSMutableArray addObject:](v16, "addObject:", v75);
    }

    id v76 = -[NSMutableArray copy](v16, "copy");
    -[UPUpdateProfileRequest setUpdateMetadataRequests:](v15, "setUpdateMetadataRequests:", v76);
  }

  else
  {
    id v23 = sub_100084680();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100289B58((uint64_t)v12, v24, v25, v26, v27, v28, v29, v30);
    }

    if (a5)
    {
      uint64_t v31 = PBSUserProfileServiceErrorForCode(300LL);
      v15 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v31);
    }

    else
    {
      v15 = 0LL;
    }
  }

  return v15;
}

+ (BOOL)_pb_sanitizeUpdateUserProfileAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 preferredLanguages]);
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredInputModes]),
        v6,
        v5,
        !v6))
  {
    id v8 = sub_100084680();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100289BC0((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }

    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

  ;
}

  ;
}

@end