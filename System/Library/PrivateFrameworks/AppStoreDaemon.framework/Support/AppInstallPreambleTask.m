@interface AppInstallPreambleTask
- (void)main;
@end

@implementation AppInstallPreambleTask

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[NSError databaseID](self->super._error, "databaseID")));
  id v4 = sub_10031DE10((uint64_t)&OBJC_CLASS___AppInstallInfo, v3);
  int64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  automaticType = (void *)self->_automaticType;
  self->_automaticType = v5;

  uint64_t v7 = ASDLogHandleForCategory(2LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    Property = (void *)self->_automaticType;
    if (Property) {
      Property = objc_getProperty(Property, v9, 80LL, 1);
    }
    id v11 = Property;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] Performing preamble checks", buf, 0xCu);
  }

  if ((unint64_t)sub_1001E2698(self->_install, (uint64_t)@"archive_type") <= 1)
  {
    error = self->super._error;
    v188[1] = 0LL;
    v13 = sub_1002DF434(error);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v16 = 0LL;
    v17 = (void *)self->_automaticType;
    if (v17) {
      v17 = objc_getProperty(v17, v15, 80LL, 1);
    }
    id v19 = v17;
    if (v14) {
      objc_setProperty_atomic(v14, v18, v19, 40LL);
    }

    v188[0] = v16;
    id v20 = sub_1002DF048(v14, v188);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = v188[0];

    if (!v21)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[RestoreKeeper shared](&OBJC_CLASS____TtC9appstored13RestoreKeeper, "shared"));
      id v24 = sub_100323D88(self->super._error);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = sub_100323C54(&self->super._error->super.isa);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v23 restoringCoordinatorForBundleID:v25 logKey:v27]);

      if (!v28)
      {
        v53 = sub_1002CD5AC( (uint64_t)&OBJC_CLASS___AppInstallPreambleResponse,  -[NSError databaseID](self->super._error, "databaseID"),  v22);
        uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
LABEL_26:
        v41 = (id *)v54;
LABEL_33:

        goto LABEL_34;
      }

      uint64_t v29 = ASDLogHandleForCategory(2LL);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v126 = (void *)self->_automaticType;
        if (v126) {
          v126 = objc_getProperty(v126, v31, 80LL, 1);
        }
        id v127 = v126;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v127;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "[%@] Found an existing restoring coordinator",  buf,  0xCu);
      }
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSError valueForProperty:](self->super._error, "valueForProperty:", @"cancel_if_duplicate"));
    unsigned int v33 = [v32 BOOLValue];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSError valueForProperty:](self->super._error, "valueForProperty:", @"item_id"));
    uint64_t v35 = objc_claimAutoreleasedReturnValue(-[NSError valueForProperty:](self->super._error, "valueForProperty:", @"bundle_id"));
    v36 = (void *)v35;
    if (v34)
    {
      v37 = -[LSApplicationRecord initWithStoreItemIdentifier:error:]( [LSApplicationRecord alloc],  "initWithStoreItemIdentifier:error:",  [v34 unsignedLongLongValue],  0);
    }

    else
    {
      if (!v35)
      {
        v42 = 0LL;
        goto LABEL_28;
      }

      v37 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v35,  0LL,  0LL);
    }

    v42 = v37;
    if (v37) {
      unsigned int v43 = v33;
    }
    else {
      unsigned int v43 = 0;
    }
    if (v43 == 1)
    {
      v44 = v14;
      id v45 = v22;
      v46 = v21;
      uint64_t v47 = ASDLogHandleForCategory(2LL);
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v122 = (void *)self->_automaticType;
        if (v122) {
          v122 = objc_getProperty(v122, v49, 80LL, 1);
        }
        id v123 = v122;
        v124 = v123;
        *(_DWORD *)buf = 138412802;
        if (v34) {
          v125 = v34;
        }
        else {
          v125 = v36;
        }
        *(void *)&buf[4] = v123;
        __int16 v190 = 2114;
        v191 = v42;
        __int16 v192 = 2114;
        v193 = v125;
      }

      uint64_t v51 = ASDErrorWithDescription(ASDErrorDomain, 601LL, v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

      v21 = v46;
      id v22 = v45;
      v14 = v44;
LABEL_29:

      id v55 = v52;
      if (v55)
      {
LABEL_30:
        id v56 = v55;

LABEL_31:
        v57 = sub_1002CD538( (uint64_t)&OBJC_CLASS___AppInstallPreambleResponse,  -[NSError databaseID](self->super._error, "databaseID"),  v21,  v56);
        uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);
LABEL_32:
        v41 = (id *)v58;
        id v22 = v56;
        goto LABEL_33;
      }

      if (*(void *)&self->super._success != 1LL) {
        goto LABEL_44;
      }
      if ((sub_1002FA52C((uint64_t)&OBJC_CLASS___AppDefaultsManager) & 1) != 0)
      {
        if (sub_1002735AC((uint64_t)&OBJC_CLASS___Restrictions)
          && sub_10027362C((uint64_t)&OBJC_CLASS___Restrictions))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
          unsigned __int8 v62 = [v61 applicationIsInstalled:@"com.apple.TVAppStore"];

          if ((v62 & 1) == 0)
          {
            id v63 = sub_100324100(&self->super._error->super.isa, 0LL);
            v64 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue(v63);
            v65 = v64;
            if (v64
              && (-[LSApplicationRecord deviceBasedVPP](v64, "deviceBasedVPP") & 1) == 0
              && (-[LSApplicationRecord isB2BCustomApp](v65, "isB2BCustomApp") & 1) == 0)
            {
              uint64_t v174 = ASDLogHandleForCategory(2LL);
              v175 = (os_log_s *)objc_claimAutoreleasedReturnValue(v174);
              if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
              {
                v179 = (void *)self->_automaticType;
                if (v179) {
                  v179 = objc_getProperty(v179, v176, 80LL, 1);
                }
                id v180 = v179;
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v180;
                _os_log_error_impl( (void *)&_mh_execute_header,  v175,  OS_LOG_TYPE_ERROR,  "[%@] Automatic download requires App Store to be installed",  buf,  0xCu);
              }

              uint64_t v78 = ASDErrorDomain;
              v79 = @"Automatic downloads requires App Store to be installed";
              uint64_t v80 = 606LL;
LABEL_53:
              uint64_t v81 = ASDErrorWithDescription(v78, v80, v79);
              v82 = (void *)objc_claimAutoreleasedReturnValue(v81);

              goto LABEL_57;
            }
          }

- (void).cxx_destruct
{
}

@end