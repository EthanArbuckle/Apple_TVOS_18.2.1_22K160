@interface CKSoftLinkAssetFetch
- (CKContainer)container;
- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setContainer:(id)a3;
- (void)setContainerPtr:(id)a3;
@end

@implementation CKSoftLinkAssetFetch

- (void)setContainerPtr:(id)a3
{
}

- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v35 = a3;
  id v36 = a4;
  id v8 = a5;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2050000000LL;
  v9 = (void *)qword_1000989A0;
  uint64_t v48 = qword_1000989A0;
  if (!qword_1000989A0)
  {
    v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472LL;
    uint64_t v42 = (uint64_t)sub_100004FEC;
    v43 = &unk_10008D7A0;
    v44 = &v45;
    sub_100004FEC((uint64_t)&v40);
    v9 = (void *)v46[3];
  }

  v34 = v8;
  v10 = v9;
  _Block_object_dispose(&v45, 8);
  id v11 = objc_alloc_init(v10);
  [v11 setApplicationBundleIdentifierOverride:@"com.apple.CloudTelemetryService.xpc"];
  objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v36, "allowsCellularAccess"));
  objc_msgSend(v11, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v36, "_allowsExpensiveAccess"));
  [v11 setPreferAnonymousRequests:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKSoftLinkAssetFetch container](self, "container"));
  if (!v12)
  {
    uint64_t v45 = 0LL;
    v46 = &v45;
    uint64_t v47 = 0x2050000000LL;
    v13 = (void *)qword_1000989B0;
    uint64_t v48 = qword_1000989B0;
    if (!qword_1000989B0)
    {
      v40 = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472LL;
      uint64_t v42 = (uint64_t)sub_1000050E8;
      v43 = &unk_10008D7A0;
      v44 = &v45;
      sub_1000050E8((uint64_t)&v40);
      v13 = (void *)v46[3];
    }

    id v14 = v13;
    _Block_object_dispose(&v45, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v14 containerWithIdentifier:@"com.apple.acp.developer.apptelemetry.storebags"]);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 publicCloudDatabase]);
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2050000000LL;
  v16 = (void *)qword_1000989B8;
  uint64_t v48 = qword_1000989B8;
  if (!qword_1000989B8)
  {
    v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472LL;
    uint64_t v42 = (uint64_t)sub_10000513C;
    v43 = &unk_10008D7A0;
    v44 = &v45;
    sub_10000513C((uint64_t)&v40);
    v16 = (void *)v46[3];
  }

  v17 = v16;
  _Block_object_dispose(&v45, 8);
  id v18 = objc_alloc(v17);
  v40 = 0LL;
  uint64_t v41 = (uint64_t)&v40;
  uint64_t v42 = 0x2020000000LL;
  v19 = (void *)qword_1000989C0;
  v43 = (void *)qword_1000989C0;
  if (!qword_1000989C0)
  {
    v20 = (void *)sub_100005040();
    v19 = dlsym(v20, "CKCurrentUserDefaultName");
    *(void *)(v41 + 24) = v19;
    qword_1000989C0 = (uint64_t)v19;
  }

  _Block_object_dispose(&v40, 8);
  if (!v19) {
    sub_100073CC4();
  }
  id v21 = [v18 initWithZoneName:v35 ownerName:*v19];
  else {
    v22 = @"%@StoreBag.json";
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v35));
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2050000000LL;
  v24 = (void *)qword_1000989C8;
  uint64_t v48 = qword_1000989C8;
  if (!qword_1000989C8)
  {
    v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472LL;
    uint64_t v42 = (uint64_t)sub_100005190;
    v43 = &unk_10008D7A0;
    v44 = &v45;
    sub_100005190((uint64_t)&v40);
    v24 = (void *)v46[3];
  }

  v25 = v24;
  _Block_object_dispose(&v45, 8);
  id v26 = [[v25 alloc] initWithRecordName:v23 zoneID:v21];
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2050000000LL;
  v27 = (void *)qword_1000989D0;
  uint64_t v48 = qword_1000989D0;
  if (!qword_1000989D0)
  {
    v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472LL;
    uint64_t v42 = (uint64_t)sub_1000051E4;
    v43 = &unk_10008D7A0;
    v44 = &v45;
    sub_1000051E4((uint64_t)&v40);
    v27 = (void *)v46[3];
  }

  v28 = v27;
  _Block_object_dispose(&v45, 8);
  id v29 = objc_alloc(v28);
  id v49 = v26;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));
  id v31 = [v29 initWithRecordIDs:v30];

  [v31 setShouldFetchAssetContentInMemory:1];
  [v31 setDropInMemoryAssetContentASAP:0];
  [v31 setConfiguration:v11];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100004F08;
  v37[3] = &unk_10008D778;
  id v38 = v26;
  id v39 = v34;
  id v32 = v34;
  id v33 = v26;
  [v31 setFetchRecordsCompletionBlock:v37];
  [v15 addOperation:v31];
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end