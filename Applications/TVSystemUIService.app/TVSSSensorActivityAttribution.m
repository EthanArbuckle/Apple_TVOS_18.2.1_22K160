@interface TVSSSensorActivityAttribution
- (BOOL)isEqual:(id)a3;
- (BOOL)usedRecently;
- (TVSSSensorActivityAttribution)initWithSTUIDataAccessAttribution:(id)a3;
- (id)_effectiveDisplayName;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)sensorType;
@end

@implementation TVSSSensorActivityAttribution

- (id)_effectiveDisplayName
{
  v22 = self;
  v21[1] = (id)a2;
  v21[0] = -[TVSSActivityAttribution displayName](self, "displayName");
  if (!v21[0])
  {
    v21[0] = -[TVSSActivityAttribution executableDisplayName](v22, "executableDisplayName");
  }

  if (!v21[0])
  {
    v21[0] = -[TVSSActivityAttribution bundleIdentifier](v22, "bundleIdentifier");
  }

  if (!v21[0])
  {
    v21[0] = TVSSLocString(@"TVSSUnknownPrivacyAttribution");

    id v20 = PrivacyLog();
    char v19 = 17;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
    {
      log = (os_log_s *)v20;
      os_log_type_t type = v19;
      v15 = TVSSSensorTypeDescription(-[TVSSSensorActivityAttribution sensorType](v22, "sensorType"));
      v8 = v15;
      v18 = v8;
      v14 = -[TVSSActivityAttribution bundleIdentifier](v22, "bundleIdentifier");
      int v9 = -[TVSSSensorActivityAttribution usedRecently](v22, "usedRecently");
      int v10 = -[TVSSActivityAttribution isSystemService](v22, "isSystemService");
      -[TVSSActivityAttribution auditToken](v22, "auditToken");
      id v13 = +[BSAuditToken tokenFromAuditToken:](&OBJC_CLASS___BSAuditToken, "tokenFromAuditToken:", v17);
      id v16 = v13;
      sub_1000B3070((uint64_t)v23, (uint64_t)v8, (uint64_t)v14, v9, v10, (uint64_t)v16);
      _os_log_fault_impl( (void *)&_mh_execute_header,  log,  type,  "Unknown process using sensor: SensorType: %{public}@, BundleId: %{public}@, UsedRecently: %{BOOL}d, IsSystemServ ice: %{BOOL}d, AuditToken: %{public}@",  v23,  0x2Cu);

      objc_storeStrong(&v16, 0LL);
      objc_storeStrong((id *)&v18, 0LL);
    }

    objc_storeStrong(&v20, 0LL);
  }

  v6 = -[TVSSActivityAttribution bundleIdentifier](v22, "bundleIdentifier");
  unsigned __int8 v7 = -[NSString isEqual:](v6, "isEqual:", @"com.apple.NetworkEndpointPickerUI");

  if ((v7 & 1) != 0)
  {
    id v2 = TVSSLagunaLocalizedString(@"TVSSControlCenterConnectedCameraTitle");
    id v3 = v21[0];
    v21[0] = v2;
  }

  id v5 = v21[0];
  objc_storeStrong(v21, 0LL);
  return v5;
}

- (TVSSSensorActivityAttribution)initWithSTUIDataAccessAttribution:(id)a3
{
  id v20 = (char *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  id v15 = [location[0] dataAccessType];
  if (v15)
  {
    if (v15 == (id)1)
    {
      uint64_t v18 = 0LL;
      id v14 = [location[0] cameraCaptureAttribution];
      id v5 = [v14 activityAttribution];
      id v6 = v17;
      id v17 = v5;
    }

    else if (v15 == (id)2)
    {
      uint64_t v18 = 2LL;
      id v13 = [location[0] locationAttribution];
      id v7 = [v13 activityAttribution];
      id v8 = v17;
      id v17 = v7;
    }
  }

  else
  {
    uint64_t v18 = 1LL;
    id v3 = [location[0] audioRecordingActivityAttribution];
    id v4 = v17;
    id v17 = v3;
  }

  id v9 = v20;
  id v20 = 0LL;
  v16.receiver = v9;
  v16.super_class = (Class)&OBJC_CLASS___TVSSSensorActivityAttribution;
  id v20 = -[TVSSActivityAttribution initWithSTActivityAttribution:](&v16, "initWithSTActivityAttribution:", v17);
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    *(void *)(v20 + 25) = v18;
    unsigned __int8 v10 = [location[0] isRecent];
    v20[17] = v10 & 1;
  }

  v12 = v20;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v51 == location[0])
  {
    char v52 = 1;
    int v49 = 1;
  }

  else
  {
    v26 = &v48;
    id v48 = location[0];
    id v9 = &OBJC_CLASS___BSEqualsBuilder;
    id v8 = v48;
    v25 = (id *)&v47;
    v47 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v48,  objc_opt_class(&OBJC_CLASS___TVSSSensorActivityAttribution));
    v11 = v47;
    unsigned __int8 v10 = &v40;
    id v15 = _NSConcreteStackBlock;
    v40 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v41 = -1073741824;
    int v42 = 0;
    v43 = sub_1001321E4;
    v44 = &unk_1001BACB0;
    v24 = &v45;
    id v45 = v48;
    v23 = (id *)&v46;
    v46 = v51;
    id obj = 0LL;
    id v3 = -[BSEqualsBuilder appendEqualsBlocks:](v11, "appendEqualsBlocks:", &v40, 0LL);
    id v14 = v47;
    uint64_t v12 = *(void *)(&v51->_usedRecently + 1);
    id v13 = &v34;
    v34 = v15;
    int v35 = v16;
    int v36 = 0;
    v37 = sub_100132238;
    v38 = &unk_1001B76F0;
    v22 = &v39;
    id v39 = v48;
    id v4 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v14, "appendUnsignedInteger:counterpart:", v12, v13);
    char v19 = v47;
    int v17 = *((unsigned __int8 *)&v51->super._isSystemExecutable + 1);
    uint64_t v18 = &v28;
    v28 = v15;
    int v29 = v16;
    int v30 = 0;
    v31 = sub_100132268;
    v32 = &unk_1001B7A30;
    v21 = &v33;
    id v33 = v48;
    int v20 = 1;
    id v5 = -[BSEqualsBuilder appendBool:counterpart:](v19, "appendBool:counterpart:", v17 & 1, v18);
    unsigned __int8 v6 = -[BSEqualsBuilder isEqual](v47, "isEqual");
    char v52 = v6 & 1 & v20;
    int v49 = v20;
    objc_storeStrong(v21, obj);
    objc_storeStrong(v22, obj);
    objc_storeStrong(v23, obj);
    objc_storeStrong(v24, obj);
    objc_storeStrong(v25, obj);
    objc_storeStrong(v26, obj);
  }

  objc_storeStrong(location, 0LL);
  return v52 & 1;
}

- (unint64_t)hash
{
  char v19 = self;
  v18[1] = (id)a2;
  id v9 = v18;
  v18[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v7 = v18[0];
  unsigned __int8 v6 = &v12;
  uint64_t v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = sub_1001323E4;
  int v16 = &unk_1001B76F0;
  location = (id *)&v17;
  int v17 = v19;
  id obj = 0LL;
  id v2 = [v7 appendHashingBlocks:0];
  id v3 = [v18[0] appendUnsignedInteger:*(void *)(&v19->_usedRecently + 1)];
  id v4 = [v18[0] appendBool:*(&v19->super._isSystemExecutable + 1)];
  id v11 = [v18[0] hash];
  objc_storeStrong(location, obj);
  objc_storeStrong(v9, obj);
  return (unint64_t)v11;
}

- (id)succinctDescriptionBuilder
{
  unsigned __int8 v10 = self;
  v9[1] = (id)a2;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSSensorActivityAttribution;
  v9[0] = -[TVSSActivityAttribution succinctDescriptionBuilder](&v8, "succinctDescriptionBuilder");
  id v5 = v9[0];
  unsigned __int8 v6 = TVSSSensorTypeDescription(*(void *)(&v10->_usedRecently + 1));
  id v2 = objc_msgSend(v5, "appendObject:withName:");

  id v3 = objc_unsafeClaimAutoreleasedReturnValue(objc_msgSend(v9[0], "appendBool:withName:", *(&v10->super._isSystemExecutable
                                                                                           + 1), @"usedRecently"));
  id v7 = v9[0];
  objc_storeStrong(v9, 0LL);
  return v7;
}

- (unint64_t)sensorType
{
  return *(void *)(&self->_usedRecently + 1);
}

- (BOOL)usedRecently
{
  return *(&self->super._isSystemExecutable + 1);
}

@end