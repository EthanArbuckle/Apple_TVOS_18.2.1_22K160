@interface CCDDeviceUploadSubmitDeviceRequest
- (DEPDeviceUploadSubmitDeviceRequestPayload)submitDeviceRequestPayload;
- (id)_deviceDetails;
- (id)endpointPath;
- (id)httpMethod;
- (id)requestBody;
- (int64_t)requestType;
- (void)setSubmitDeviceRequestPayload:(id)a3;
@end

@implementation CCDDeviceUploadSubmitDeviceRequest

- (int64_t)requestType
{
  return 3LL;
}

- (id)httpMethod
{
  return @"POST";
}

- (id)endpointPath
{
  return @"/device/upload/submitrequest";
}

- (id)requestBody
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadSubmitDeviceRequest submitDeviceRequestPayload](self, "submitDeviceRequestPayload"));
  v20[0] = kDEPDeviceUploadOrgIdKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 orgId]);
  v21[0] = v19;
  v20[1] = kDEPDeviceUploadOrgNameKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 orgName]);
  v21[1] = v18;
  v20[2] = kDEPDeviceUploadRequestTypeKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 requestType]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v17 code]);
  v21[2] = v16;
  v20[3] = kDEPDeviceUploadSubmitterDsidKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 submitter]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v15 dsid]);
  v21[3] = v4;
  v20[4] = kDEPDeviceUploadSubmitterNameKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 submitter]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  v21[4] = v6;
  v20[5] = kDEPDeviceUploadSoldToIdKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 soldToId]);
  v21[5] = v7;
  v20[6] = kDEPDeviceUploadApproverDsidKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 approver]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]);
  v21[6] = v9;
  v20[7] = kDEPDeviceUploadApproverNameKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 approver]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  v21[7] = v11;
  v20[8] = kDEPDeviceUploadDeviceDetailsKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadSubmitDeviceRequest _deviceDetails](self, "_deviceDetails"));
  v21[8] = v12;
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  9LL));

  return v14;
}

- (id)_deviceDetails
{
  if (+[CCDDeviceUtilities isiPad](&OBJC_CLASS___CCDDeviceUtilities, "isiPad"))
  {
    v2 = @"MQD22LL/A";
  }

  else if (+[CCDDeviceUtilities isiPhone](&OBJC_CLASS___CCDDeviceUtilities, "isiPhone"))
  {
    v2 = @"MNAC2LL/A";
  }

  else
  {
    BOOL v3 = +[CCDDeviceUtilities isAppleTV](&OBJC_CLASS___CCDDeviceUtilities, "isAppleTV");
    if (v3)
    {
      v2 = @"MR8A2LL/A";
    }

    else
    {
      v6 = *(os_log_s **)(DEPLogObjects(v3, v4, v5) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Unknown device type. Using actual model number, which is unlikely to work once the request is approved",  v16,  2u);
      }

      v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities modelNumber](&OBJC_CLASS___CCDDeviceUtilities, "modelNumber"));
    }
  }

  v17[0] = kDEPDeviceUploadSerialNumberKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities serialNumber](&OBJC_CLASS___CCDDeviceUtilities, "serialNumber"));
  v18[0] = v7;
  v17[1] = kDEPDeviceUploadProductFamilyKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceType](&OBJC_CLASS___CCDDeviceUtilities, "deviceType"));
  v18[1] = v8;
  v18[2] = @"iOS Device";
  v17[2] = kDEPDeviceUploadProductDescriptionKey;
  v17[3] = kDEPDeviceUploadStorageSizeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceCapacity](&OBJC_CLASS___CCDDeviceUtilities, "deviceCapacity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
  v18[3] = v10;
  v18[4] = @"size unknown";
  v17[4] = kDEPDeviceUploadScreenSizeKey;
  v17[5] = kDEPDeviceUploadColorKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceColor](&OBJC_CLASS___CCDDeviceUtilities, "deviceColor"));
  v18[5] = v11;
  v17[6] = kDEPDeviceUploadModelKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceType](&OBJC_CLASS___CCDDeviceUtilities, "deviceType"));
  v17[7] = kDEPDeviceUploadPartNumberKey;
  v18[6] = v12;
  v18[7] = v2;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  8LL));
  v19 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));

  return v14;
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)submitDeviceRequestPayload
{
  return self->_submitDeviceRequestPayload;
}

- (void)setSubmitDeviceRequestPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end