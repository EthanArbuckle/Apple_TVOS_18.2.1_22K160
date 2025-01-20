@interface UAAdvertisableItem
- (BOOL)alwaysEligible;
- (BOOL)alwaysPick;
- (id)description;
- (id)logString;
- (id)statusString;
- (int64_t)alwaysPickValue;
@end

@implementation UAAdvertisableItem

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___UAAdvertisableItem;
  id v3 = -[UAAdvertisableItem description](&v22, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = sub_10005C364((uint64_t)-[UAAdvertisableItem type](self, "type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem uuid](self, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem activityType](self, "activityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[UAAdvertisableItem payloadForIdentifier:]( self,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
  id v8 = sub_10005BD28(v7, 32LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem webpageURL](self, "webpageURL"));
  v11 = &stru_1000BE738;
  if (v10) {
    v12 = @" webPageURL=<private>";
  }
  else {
    v12 = &stru_1000BE738;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem referrerURL](self, "referrerURL"));
  if (v13) {
    v14 = @" referrerURL=<private>";
  }
  else {
    v14 = &stru_1000BE738;
  }
  unsigned int v15 = -[UAAdvertisableItem eligibleToAdvertise](self, "eligibleToAdvertise");
  v16 = @"NO";
  if (v15) {
    v16 = @"YES";
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ { type = %@; uuid = %@;  activityType = %@; userInfo = %@; %@%@ %@ eligible=%@}",
                    v20,
                    v19,
                    v5,
                    v6,
                    v9,
                    v12,
                    v14,
                    v11,
                    v16));

  return v17;
}

- (id)logString
{
  id v3 = &APP_SANDBOX_READ_WRITE_ptr;
  id v4 = -[UAAdvertisableItem type](self, "type");
  if (v4 == (id)1)
  {
    v5 = &stru_1000BE738;
  }

  else
  {
    v6 = sub_10005C364((uint64_t)-[UAAdvertisableItem type](self, "type"));
    id v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:", v3));
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem uuid](self, "uuid"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem activityType](self, "activityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[UAAdvertisableItem payloadForIdentifier:]( self,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
  id v11 = sub_10005BD28(v10, 8LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem payloads](self, "payloads"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ %@ %@ .userInfo=%@ payloads=%ld",  v5,  v8,  v9,  v12,  [v13 count]));

  if (v4 != (id)1)
  {
  }

  return v14;
}

- (id)statusString
{
  id v3 = -[UAAdvertisableItem type](self, "type");
  if (v3 == (id)1)
  {
    id v4 = &stru_1000BE738;
  }

  else
  {
    v5 = sub_10005C364((uint64_t)-[UAAdvertisableItem type](self, "type"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v4 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:",  v33));
  }

  uint64_t v49 = objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem activityType](self, "activityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem dynamicActivityType](self, "dynamicActivityType"));
  v7 = &stru_1000BE738;
  if (v6)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem dynamicActivityType](self, "dynamicActivityType"));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @":%@", v34));
  }

  else
  {
    v51 = &stru_1000BE738;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem uuid](self, "uuid"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  else {
    v9 = &stru_1000BE738;
  }
  else {
    v10 = @" !handOff";
  }
  v50 = v4;
  v48 = v8;
  unsigned int v47 = -[UAAdvertisableItem alwaysPick](self, "alwaysPick");
  v42 = v9;
  v40 = v10;
  if (v47) {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" AlwaysPickPriority=%li ",  -[UAAdvertisableItem alwaysPickValue](self, "alwaysPickValue")));
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem options](self, "options"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:_UAUserActivityContainsCloudDocsKey]);
  unsigned int v11 = [v45 BOOLValue];
  v12 = " cloudDoc";
  if (!v11) {
    v12 = "";
  }
  v37 = v12;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem options](self, "options"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:_UAUserActivityContainsUnsynchronizedCloudDocsKey]);
  unsigned int v13 = [v43 BOOLValue];
  v14 = " unSynchCloudDoc";
  if (!v13) {
    v14 = "";
  }
  v36 = v14;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem options](self, "options"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:_UAUserActivityContainsFileProviderURLKey]);
  else {
    unsigned int v15 = "";
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue( -[UAAdvertisableItem payloadForIdentifier:]( self,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
  id v16 = sub_10005BD28(v38, 24LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem webpageURL](self, "webpageURL"));
  if (v18)
  {
    if ((os_trace_get_mode() & 0x1000000) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem webpageURL](self, "webpageURL"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" url=%@",  v32));
      int v35 = 1;
    }

    else
    {
      int v35 = 0;
      v19 = @"url=<private>";
    }
  }

  else
  {
    int v35 = 0;
    v19 = &stru_1000BE738;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem referrerURL](self, "referrerURL"));
  if (!v20)
  {
    v21 = &stru_1000BE738;
    goto LABEL_31;
  }

  if ((os_trace_get_mode() & 0x1000000) == 0)
  {
    v21 = @"referrer=<private>";
LABEL_31:
    v28 = v15;
    objc_super v22 = (void *)v49;
    v23 = (__CFString *)v50;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@ %@ %@%@%@%s%s%s %@%@%@",  v50,  v49,  v51,  v52,  v42,  v40,  v7,  v37,  v36,  v28,  v17,  v19,  v21));
    goto LABEL_33;
  }

  id v31 = v3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem referrerURL](self, "referrerURL"));
  v30 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" referrer=%@", v25));
  v29 = v15;
  objc_super v22 = (void *)v49;
  v23 = (__CFString *)v50;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@ %@ %@%@%@%s%s%s %@%@%@",  v50,  v49,  v51,  v52,  v42,  v40,  v7,  v37,  v36,  v29,  v17,  v19,  v26));

  v6 = v30;
  id v3 = v31;
LABEL_33:

  if (v35)
  {
  }

  if (v47) {
  if (v6)
  }
  {
  }

  if (v3 != (id)1)
  {
  }

  return v24;
}

- (BOOL)alwaysPick
{
  return self->_alwaysPick;
}

- (int64_t)alwaysPickValue
{
  return self->_alwaysPickValue;
}

- (BOOL)alwaysEligible
{
  return self->_alwaysEligible;
}

@end