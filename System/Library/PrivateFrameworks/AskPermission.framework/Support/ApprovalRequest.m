@interface ApprovalRequest
+ (id)createUniqueIDFromRequestID:(id)a3 andCreatedDate:(id)a4;
+ (int64_t)lobForProductType:(id)a3;
+ (int64_t)lobForSubscription:(id)a3;
- (ApprovalRequest)initWithApproverDSID:(id)a3 createdDate:(id)a4 modifiedDate:(id)a5 requestIdentifier:(id)a6 uniqueIdentifier:(id)a7 canSendViaMessages:(BOOL)a8 itemBundleID:(id)a9 itemDescription:(id)a10 itemIdentifier:(id)a11 itemTitle:(id)a12 localizations:(id)a13 offerName:(id)a14 mocked:(BOOL)a15 previewURL:(id)a16 productType:(id)a17 productTypeName:(id)a18 productURL:(id)a19 requesterName:(id)a20 requesterDSID:(id)a21 requestInfo:(id)a22 requestString:(id)a23 requestSummary:(id)a24 priceSummary:(id)a25 status:(int64_t)a26;
- (ApprovalRequest)initWithApproverStorageItem:(id)a3;
- (ApprovalRequest)initWithCloudPushDictionary:(id)a3;
- (ApprovalRequest)initWithCloudPushDictionary:(id)a3 bag:(id)a4;
- (ApprovalRequest)initWithDictionary:(id)a3;
- (ApprovalRequest)initWithRequestStorageItem:(id)a3;
- (BOOL)canSendViaMessages;
- (BOOL)isMocked;
- (BOOL)isSubscription;
- (NSDate)createdDate;
- (NSDate)date;
- (NSDate)modifiedDate;
- (NSDictionary)requestInfo;
- (NSNumber)starRating;
- (NSString)ageRating;
- (NSString)approverDSID;
- (NSString)description;
- (NSString)itemBundleID;
- (NSString)itemDescription;
- (NSString)itemIdentifier;
- (NSString)itemTitle;
- (NSString)localizedPrice;
- (NSString)offerName;
- (NSString)priceSummary;
- (NSString)productType;
- (NSString)productTypeName;
- (NSString)requestIdentifier;
- (NSString)requestString;
- (NSString)requestSummary;
- (NSString)requesterDSID;
- (NSString)requesterName;
- (NSString)thumbnailURLString;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (NSURL)productURL;
- (RequestLocalizations)localizations;
- (id)compile;
- (id)metricsApp;
- (id)metricsTopic;
- (int64_t)lineOfBusiness;
- (int64_t)status;
- (void)updateStatus:(int64_t)a3 withApproverDSID:(id)a4;
@end

@implementation ApprovalRequest

- (ApprovalRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v187.receiver = self;
  v187.super_class = (Class)&OBJC_CLASS___ApprovalRequest;
  v5 = -[ApprovalRequest init](&v187, "init");

  if (!v5) {
    goto LABEL_115;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ageRating"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }
  id v186 = v8;

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"approverDSID"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    id v11 = v9;
  }
  else {
    id v11 = 0LL;
  }
  id v185 = v11;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"canSendViaMessages"]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    id v14 = v12;
  }
  else {
    id v14 = 0LL;
  }
  id v15 = v14;

  unsigned __int8 v172 = [v15 BOOLValue];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"createdTimeInterval"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    id v18 = v16;
  }

  else
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
    {
      [v16 doubleValue];
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      if (!v20) {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = (objc_class *)objc_opt_class(v16);
        v23 = NSStringFromClass(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 138543618;
        v189 = @"createdTimeInterval";
        __int16 v190 = 2114;
        v191 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.",  buf,  0x16u);
      }

      id v18 = 0LL;
    }
  }

  id v25 = v18;

  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"modifiedTimeInterval"]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
  {
    id v28 = v26;
  }

  else
  {
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v26, v29) & 1) != 0)
    {
      [v26 doubleValue];
      id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    }

    else
    {
      id v28 = 0LL;
    }
  }

  id obj = v28;
  id v173 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"identifier"]);
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString);
  v174 = v25;
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
  {
    id v32 = v30;
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    if (!v33) {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      v35 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
      v36 = NSStringFromClass(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (objc_class *)objc_opt_class(v30);
      v39 = NSStringFromClass(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *(_DWORD *)buf = 138543874;
      v189 = @"identifier";
      __int16 v190 = 2114;
      v191 = v37;
      __int16 v192 = 2114;
      v193 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.",  buf,  0x20u);

      id v25 = v174;
    }

    id v32 = 0LL;
  }

  id v184 = v32;

  v41 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uniqueIdentifier"]);
  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
  {
    id v43 = v41;
  }

  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    if (!v44) {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 OSLogObject]);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      v46 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
      v47 = NSStringFromClass(v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      v49 = (objc_class *)objc_opt_class(v41);
      v50 = NSStringFromClass(v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      *(_DWORD *)buf = 138543874;
      v189 = @"uniqueIdentifier";
      __int16 v190 = 2114;
      v191 = v48;
      __int16 v192 = 2114;
      v193 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.",  buf,  0x20u);

      id v25 = v174;
    }

    id v43 = 0LL;
  }

  id v183 = v43;

  v52 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundleID"]);
  uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0) {
    id v54 = v52;
  }
  else {
    id v54 = 0LL;
  }
  id v182 = v54;

  v55 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemDescription"]);
  uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0) {
    id v57 = v55;
  }
  else {
    id v57 = 0LL;
  }
  id v181 = v57;

  v58 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemTitle"]);
  uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0) {
    id v60 = v58;
  }
  else {
    id v60 = 0LL;
  }
  id v180 = v60;

  v61 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemIdentifier"]);
  uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0)
  {
    id v63 = v61;
  }

  else
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    if (!v64) {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64 OSLogObject]);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    {
      v66 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
      v67 = NSStringFromClass(v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v69 = (objc_class *)objc_opt_class(v61);
      v70 = NSStringFromClass(v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      *(_DWORD *)buf = 138543874;
      v189 = @"itemIdentifier";
      __int16 v190 = 2114;
      v191 = v68;
      __int16 v192 = 2114;
      v193 = v71;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.",  buf,  0x20u);

      id v25 = v174;
    }

    id v63 = 0LL;
  }

  id v179 = v63;

  v72 = objc_alloc(&OBJC_CLASS___RequestLocalizations);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"localizations"]);
  uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v73, v74) & 1) != 0) {
    id v75 = v73;
  }
  else {
    id v75 = 0LL;
  }
  id v76 = v75;

  v178 = -[RequestLocalizations initWithDictionary:](v72, "initWithDictionary:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"offerName"]);
  uint64_t v78 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v77, v78) & 1) != 0) {
    id v79 = v77;
  }
  else {
    id v79 = 0LL;
  }
  id v177 = v79;

  v80 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mocked"]);
  uint64_t v81 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v80, v81) & 1) != 0) {
    id v82 = v80;
  }
  else {
    id v82 = 0LL;
  }
  id v83 = v82;

  unsigned __int8 v168 = [v83 BOOLValue];
  v84 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"previewURL"]);
  uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v84, v85) & 1) != 0)
  {
    id v86 = v84;
  }

  else
  {
    uint64_t v87 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v84, v87) & 1) != 0) {
      id v86 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v84));
    }
    else {
      id v86 = 0LL;
    }
  }

  id v167 = v86;
  id v170 = v86;

  v88 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productType"]);
  uint64_t v89 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v88, v89) & 1) != 0) {
    id v90 = v88;
  }
  else {
    id v90 = 0LL;
  }
  id v176 = v90;

  v91 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productTypeName"]);
  uint64_t v92 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v91, v92) & 1) != 0) {
    id v93 = v91;
  }
  else {
    id v93 = 0LL;
  }
  id v175 = v93;

  v94 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productURL"]);
  uint64_t v95 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v94, v95) & 1) != 0)
  {
    id v96 = v94;
  }

  else
  {
    uint64_t v97 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v94, v97) & 1) == 0)
    {
      v98 = 0LL;
      goto LABEL_81;
    }

    id v96 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v94, v167));
  }

  v98 = v96;
LABEL_81:
  id v169 = v98;

  v99 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requesterDSID"]);
  uint64_t v100 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v99, v100) & 1) != 0) {
    id v101 = v99;
  }
  else {
    id v101 = 0LL;
  }
  id v102 = v101;

  v103 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requesterName"]);
  uint64_t v104 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v103, v104) & 1) != 0) {
    id v105 = v103;
  }
  else {
    id v105 = 0LL;
  }
  id v106 = v105;

  v107 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"starRating"]);
  uint64_t v108 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v107, v108) & 1) != 0) {
    id v109 = v107;
  }
  else {
    id v109 = 0LL;
  }
  id v110 = v109;

  v111 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"status"]);
  uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0) {
    id v113 = v111;
  }
  else {
    id v113 = 0LL;
  }
  id v114 = v113;

  id v115 = [v114 integerValue];
  v116 = (NSString *)[v186 copy];
  ageRating = v5->_ageRating;
  v5->_ageRating = v116;

  v118 = (NSString *)[v185 copy];
  approverDSID = v5->_approverDSID;
  v5->_approverDSID = v118;

  v5->_canSendViaMessages = v172;
  if (v25)
  {
    v120 = (NSDate *)v25;
    createdDate = v5->_createdDate;
    v5->_createdDate = v120;
  }

  else
  {
    createdDate = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    objc_storeStrong((id *)&v5->_createdDate, createdDate);
  }

  objc_storeStrong((id *)&v5->_modifiedDate, obj);
  v122 = (__CFString *)[v184 copy];
  v123 = v122;
  if (v122) {
    v124 = v122;
  }
  else {
    v124 = &stru_100031BA0;
  }
  objc_storeStrong((id *)&v5->_requestIdentifier, v124);

  v125 = (__CFString *)[v183 copy];
  v126 = v125;
  if (v125) {
    v127 = v125;
  }
  else {
    v127 = &stru_100031BA0;
  }
  objc_storeStrong((id *)&v5->_uniqueIdentifier, v127);

  v128 = (NSString *)[v182 copy];
  itemBundleID = v5->_itemBundleID;
  v5->_itemBundleID = v128;

  v130 = (NSString *)[v181 copy];
  itemDescription = v5->_itemDescription;
  v5->_itemDescription = v130;

  v132 = (NSString *)[v180 copy];
  itemTitle = v5->_itemTitle;
  v5->_itemTitle = v132;

  v134 = (__CFString *)[v179 copy];
  v135 = v134;
  if (v134) {
    v136 = v134;
  }
  else {
    v136 = &stru_100031BA0;
  }
  objc_storeStrong((id *)&v5->_itemIdentifier, v136);

  objc_storeStrong((id *)&v5->_localizations, v178);
  v5->_mocked = v168;
  v137 = (NSString *)[v177 copy];
  offerName = v5->_offerName;
  v5->_offerName = v137;

  objc_storeStrong((id *)&v5->_previewURL, v167);
  v139 = (NSString *)[v176 copy];
  productType = v5->_productType;
  v5->_productType = v139;

  v141 = (NSString *)[v175 copy];
  productTypeName = v5->_productTypeName;
  v5->_productTypeName = v141;

  objc_storeStrong((id *)&v5->_productURL, v98);
  v143 = (NSString *)[v102 copy];
  requesterDSID = v5->_requesterDSID;
  v5->_requesterDSID = v143;

  v145 = (NSString *)[v106 copy];
  requesterName = v5->_requesterName;
  v5->_requesterName = v145;

  objc_storeStrong((id *)&v5->_starRating, v109);
  v5->_status = (int64_t)v115;
  v147 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestString"]);
  uint64_t v148 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v147, v148) & 1) != 0) {
    id v149 = v147;
  }
  else {
    id v149 = 0LL;
  }
  id v150 = v149;

  v151 = (NSString *)[v150 copy];
  requestString = v5->_requestString;
  v5->_requestString = v151;

  v153 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestSummary"]);
  uint64_t v154 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v153, v154) & 1) != 0) {
    id v155 = v153;
  }
  else {
    id v155 = 0LL;
  }
  id v156 = v155;

  v157 = (NSString *)[v156 copy];
  requestSummary = v5->_requestSummary;
  v5->_requestSummary = v157;

  v159 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"priceSummary"]);
  uint64_t v160 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v159, v160) & 1) != 0) {
    id v161 = v159;
  }
  else {
    id v161 = 0LL;
  }
  id v162 = v161;

  v163 = (NSString *)[v162 copy];
  priceSummary = v5->_priceSummary;
  v5->_priceSummary = v163;

LABEL_115:
  v165 = v5;

  return v165;
}

- (ApprovalRequest)initWithApproverDSID:(id)a3 createdDate:(id)a4 modifiedDate:(id)a5 requestIdentifier:(id)a6 uniqueIdentifier:(id)a7 canSendViaMessages:(BOOL)a8 itemBundleID:(id)a9 itemDescription:(id)a10 itemIdentifier:(id)a11 itemTitle:(id)a12 localizations:(id)a13 offerName:(id)a14 mocked:(BOOL)a15 previewURL:(id)a16 productType:(id)a17 productTypeName:(id)a18 productURL:(id)a19 requesterName:(id)a20 requesterDSID:(id)a21 requestInfo:(id)a22 requestString:(id)a23 requestSummary:(id)a24 priceSummary:(id)a25 status:(int64_t)a26
{
  id v56 = a3;
  id v41 = a4;
  id v54 = a4;
  id v42 = a5;
  id v52 = a5;
  id v50 = a6;
  id v44 = a7;
  id v59 = a7;
  id v58 = a9;
  id v57 = a10;
  id v55 = a11;
  id v53 = a12;
  id v51 = a13;
  id v49 = a14;
  id v48 = a16;
  id v47 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a22;
  id v35 = a23;
  id v36 = a24;
  id v46 = a25;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___ApprovalRequest;
  v37 = -[ApprovalRequest init](&v60, "init");
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_approverDSID, a3);
    objc_storeStrong((id *)&v38->_createdDate, v41);
    objc_storeStrong((id *)&v38->_modifiedDate, v42);
    v38->_canSendViaMessages = a8;
    objc_storeStrong((id *)&v38->_requestIdentifier, a6);
    objc_storeStrong((id *)&v38->_uniqueIdentifier, v44);
    objc_storeStrong((id *)&v38->_itemBundleID, a9);
    objc_storeStrong((id *)&v38->_itemDescription, a10);
    objc_storeStrong((id *)&v38->_itemTitle, a12);
    objc_storeStrong((id *)&v38->_itemIdentifier, a11);
    objc_storeStrong((id *)&v38->_localizations, a13);
    objc_storeStrong((id *)&v38->_offerName, a14);
    v38->_mocked = a15;
    objc_storeStrong((id *)&v38->_previewURL, a16);
    objc_storeStrong((id *)&v38->_productType, a17);
    objc_storeStrong((id *)&v38->_productTypeName, a18);
    objc_storeStrong((id *)&v38->_productURL, a19);
    objc_storeStrong((id *)&v38->_requesterDSID, a21);
    objc_storeStrong((id *)&v38->_requesterName, a20);
    objc_storeStrong((id *)&v38->_requestInfo, a22);
    objc_storeStrong((id *)&v38->_requestString, a23);
    objc_storeStrong((id *)&v38->_requestSummary, a24);
    objc_storeStrong((id *)&v38->_priceSummary, a25);
    v38->_status = a26;
  }

  return v38;
}

- (ApprovalRequest)initWithApproverStorageItem:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___ApprovalRequest;
  v5 = -[ApprovalRequest init](&v47, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 ageRating]);
    ageRating = v5->_ageRating;
    v5->_ageRating = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 approverDSID]);
    approverDSID = v5->_approverDSID;
    v5->_approverDSID = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 createdDate]);
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 modifiedDate]);
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 itemDescription]);
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 itemTitle]);
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 itemIdentifier]);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 localizations]);
    localizations = v5->_localizations;
    v5->_localizations = (RequestLocalizations *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 localizedPrice]);
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 offerName]);
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 previewURL]);
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue([v4 productType]);
    productType = v5->_productType;
    v5->_productType = (NSString *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 requesterDSID]);
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue([v4 starRating]);
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v36;

    v5->_status = (int64_t)[v4 status];
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 requestString]);
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 requestSummary]);
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v40;

    uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 priceSummary]);
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v42;

    uint64_t v44 = objc_claimAutoreleasedReturnValue([v4 thumbnailURLString]);
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v44;
  }

  return v5;
}

- (ApprovalRequest)initWithRequestStorageItem:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___ApprovalRequest;
  v5 = -[ApprovalRequest init](&v51, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 ageRating]);
    ageRating = v5->_ageRating;
    v5->_ageRating = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 approverDSID]);
    approverDSID = v5->_approverDSID;
    v5->_approverDSID = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 createdDate]);
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 modifiedDate]);
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 itemDescription]);
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 itemTitle]);
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 itemIdentifier]);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 localizations]);
    localizations = v5->_localizations;
    v5->_localizations = (RequestLocalizations *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 localizedPrice]);
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 offerName]);
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 previewURL]);
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue([v4 productType]);
    productType = v5->_productType;
    v5->_productType = (NSString *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 productTypeName]);
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue([v4 productURL]);
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 requesterDSID]);
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 starRating]);
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v40;

    v5->_status = (int64_t)[v4 status];
    uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 requestString]);
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v42;

    uint64_t v44 = objc_claimAutoreleasedReturnValue([v4 requestSummary]);
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue([v4 priceSummary]);
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v46;

    uint64_t v48 = objc_claimAutoreleasedReturnValue([v4 thumbnailURLString]);
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v48;
  }

  return v5;
}

- (ApprovalRequest)initWithCloudPushDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  uint64_t v6 = -[ApprovalRequest initWithCloudPushDictionary:bag:](self, "initWithCloudPushDictionary:bag:", v4, v5);

  return v6;
}

- (ApprovalRequest)initWithCloudPushDictionary:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v276.receiver = self;
  v276.super_class = (Class)&OBJC_CLASS___ApprovalRequest;
  uint64_t v8 = -[ApprovalRequest init](&v276, "init");

  if (!v8) {
    goto LABEL_237;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"requestInfo"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    id v11 = v9;
  }
  else {
    id v11 = 0LL;
  }
  id v257 = v11;
  id v12 = v11;

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"salables"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
    id v15 = v13;
  }
  else {
    id v15 = 0LL;
  }
  id v16 = v15;

  v271 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"lockupData"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
    id v19 = v17;
  }
  else {
    id v19 = 0LL;
  }
  id v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"productType"]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    id v23 = v21;
  }
  else {
    id v23 = 0LL;
  }
  id obj = v23;
  id v24 = v23;

  if ([v24 isEqualToString:@"A"])
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"parentSalables"]);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
      id v27 = v25;
    }
    else {
      id v27 = 0LL;
    }
    id v28 = v27;

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 firstObject]);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0) {
      id v31 = v29;
    }
    else {
      id v31 = 0LL;
    }
    id v32 = v31;

    v270 = v32;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"lockupData"]);
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
      id v35 = v33;
    }
    else {
      id v35 = 0LL;
    }
    id v269 = v35;
  }

  else
  {
    id v269 = 0LL;
    v270 = 0LL;
  }

  id v36 = v6;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"requestId"]);
  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString);
  id v39 = v7;
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0) {
    id v40 = v37;
  }
  else {
    id v40 = 0LL;
  }
  id v41 = v40;

  v268 = v41;
  if (!v41)
  {
    int v55 = 1;
    id v7 = v39;
    id v6 = v36;
    id v56 = v271;
    goto LABEL_235;
  }

  objc_storeStrong((id *)&v8->_requestIdentifier, v40);
  uint64_t v42 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"clientInfo"]);
  uint64_t v43 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  uint64_t v44 = (void *)v43;
  id v265 = v24;
  v266 = v20;
  v267 = (void *)v42;
  id v7 = v39;
  if (v42)
  {
    if (!v43) {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 OSLogObject]);
    id v6 = v36;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      id v46 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543618;
      id v279 = v46;
      __int16 v280 = 2112;
      v281 = v267;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: clientInfo: %@", buf, 0x16u);
    }

    __int128 v272 = 0u;
    __int128 v273 = 0u;
    __int128 v274 = 0u;
    __int128 v275 = 0u;
    id v47 = (id)objc_claimAutoreleasedReturnValue([v267 componentsSeparatedByString:@"-"]);
    id v48 = [v47 countByEnumeratingWithState:&v272 objects:v277 count:16];
    if (v48)
    {
      id v49 = v48;
      id v252 = v12;
      id v261 = v7;
      v263 = v36;
      uint64_t v50 = *(void *)v273;
      do
      {
        for (i = 0LL; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v273 != v50) {
            objc_enumerationMutation(v47);
          }
          id v52 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v272 + 1) + 8 * (void)i) componentsSeparatedByString:@":"]);
          id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 firstObject]);
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v52 lastObject]);
        }

        id v49 = [v47 countByEnumeratingWithState:&v272 objects:v277 count:16];
      }

      while (v49);
      uint64_t v44 = v47;
      id v7 = v261;
      id v6 = v263;
      id v12 = v252;
    }

    else
    {
      uint64_t v44 = v47;
    }
  }

  else
  {
    if (!v43) {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v47 = (id)objc_claimAutoreleasedReturnValue([v44 OSLogObject]);
    id v6 = v36;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
    {
      id v57 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543362;
      id v279 = v57;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v47,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Server Response - No clientInfo passed from child device",  buf,  0xCu);
    }
  }

  id v58 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"adamId"]);
  uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0) {
    id v60 = v58;
  }
  else {
    id v60 = 0LL;
  }
  id v24 = v265;
  id v61 = v60;

  v260 = v61;
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 stringValue]);
  uint64_t v63 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v62, v63) & 1) != 0) {
    id v64 = v62;
  }
  else {
    id v64 = 0LL;
  }
  id v65 = v64;

  v259 = v65;
  if (v65)
  {
    objc_storeStrong((id *)&v8->_itemIdentifier, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"approveButton"]);
    uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0) {
      id v68 = v66;
    }
    else {
      id v68 = 0LL;
    }
    id v264 = v68;

    v69 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"declineButton"]);
    uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0) {
      id v71 = v69;
    }
    else {
      id v71 = 0LL;
    }
    id v262 = v71;

    v72 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"requestString"]);
    uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v72, v73) & 1) != 0) {
      id v74 = v72;
    }
    else {
      id v74 = 0LL;
    }
    id v75 = v74;

    v254 = v75;
    if (!v75)
    {
      int v55 = 1;
      id v20 = v266;
LABEL_233:

      goto LABEL_234;
    }

    objc_storeStrong((id *)&v8->_requestString, v74);
    id v76 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"requestSummary"]);
    uint64_t v77 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v76, v77) & 1) != 0) {
      id v78 = v76;
    }
    else {
      id v78 = 0LL;
    }
    id v249 = v78;

    objc_storeStrong((id *)&v8->_requestSummary, v78);
    id v79 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"priceSummary"]);
    uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v79, v80) & 1) != 0) {
      id v81 = v79;
    }
    else {
      id v81 = 0LL;
    }
    id v248 = v81;

    objc_storeStrong((id *)&v8->_priceSummary, v81);
    id v82 = (void *)objc_claimAutoreleasedReturnValue([v266 objectForKeyedSubscript:@"contentRating"]);
    uint64_t v83 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v82, v83) & 1) != 0) {
      id v84 = v82;
    }
    else {
      id v84 = 0LL;
    }
    id v85 = v84;

    v247 = v85;
    id v86 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:@"name"]);
    uint64_t v87 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v86, v87) & 1) != 0) {
      id v88 = v86;
    }
    else {
      id v88 = 0LL;
    }
    id v89 = v88;

    if ([v89 length]) {
      id v90 = (const __CFString *)v89;
    }
    else {
      id v90 = @"0";
    }
    ageRating = v8->_ageRating;
    v8->_ageRating = &v90->isa;

    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"approverDsId"]);
    uint64_t v93 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v92, v93) & 1) != 0) {
      id v94 = v92;
    }
    else {
      id v94 = 0LL;
    }
    id v95 = v94;

    v245 = v95;
    uint64_t v96 = objc_claimAutoreleasedReturnValue([v95 stringValue]);
    approverDSID = v8->_approverDSID;
    v8->_approverDSID = (NSString *)v96;

    v98 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v98, "setDateFormat:", @"YYYY-MM-dd'T'HH:mm:ss.SZZZ");
    uint64_t v99 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"requestCreatedUtc"]);
    v250 = (void *)v99;
    if (v99)
    {
      uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v98, "dateFromString:", v99));
      if (v100) {
        goto LABEL_100;
      }
      id v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v101) {
        id v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v102 = (void *)objc_claimAutoreleasedReturnValue([v101 OSLogObject]);
      if (!os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_FAULT))
      {
LABEL_99:

        uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        id v24 = v265;
LABEL_100:
        objc_storeStrong((id *)&v8->_createdDate, v100);
        uint64_t v107 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"approvalStatusUpdatedUtc"]);
        v251 = v100;
        id v246 = v89;
        v243 = (void *)v107;
        if (v107)
        {
          uint64_t v108 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v98, "dateFromString:", v107));
          id v109 = v108;
          if (v108)
          {
            id v110 = v108;
            modifiedDate = v8->_modifiedDate;
            v8->_modifiedDate = v110;
          }

          else
          {
            modifiedDate = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            objc_storeStrong((id *)&v8->_modifiedDate, modifiedDate);
          }

          uint64_t v100 = v251;
        }

        else
        {
          uint64_t v112 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v109 = v8->_modifiedDate;
          v8->_modifiedDate = (NSDate *)v112;
        }

        uint64_t v113 = objc_claimAutoreleasedReturnValue( +[ApprovalRequest createUniqueIDFromRequestID:andCreatedDate:]( &OBJC_CLASS___ApprovalRequest,  "createUniqueIDFromRequestID:andCreatedDate:",  v8->_requestIdentifier,  v100));
        uniqueIdentifier = v8->_uniqueIdentifier;
        v8->_uniqueIdentifier = (NSString *)v113;

        id v115 = (void *)objc_claimAutoreleasedReturnValue([v271 objectForKeyedSubscript:@"bundleIdentifier"]);
        uint64_t v116 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v115, v116) & 1) != 0) {
          id v117 = v115;
        }
        else {
          id v117 = 0LL;
        }
        id v118 = v117;

        if (v118)
        {
          v119 = (NSString *)v118;
          itemBundleID = (__CFString *)v8->_itemBundleID;
          v8->_itemBundleID = v119;
        }

        else
        {
          v121 = (void *)objc_claimAutoreleasedReturnValue([v270 objectForKeyedSubscript:@"bundleIdentifier"]);
          uint64_t v122 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v121, v122) & 1) != 0) {
            id v123 = v121;
          }
          else {
            id v123 = 0LL;
          }
          itemBundleID = (__CFString *)v123;

          if (itemBundleID) {
            v124 = itemBundleID;
          }
          else {
            v124 = @"Unknown";
          }
          objc_storeStrong((id *)&v8->_itemBundleID, v124);
        }

        v125 = (void *)objc_claimAutoreleasedReturnValue([v271 objectForKeyedSubscript:@"localizedName"]);
        uint64_t v126 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v125, v126) & 1) != 0) {
          id v127 = v125;
        }
        else {
          id v127 = 0LL;
        }
        id v128 = v127;

        if (v128)
        {
          v129 = (NSString *)v128;
          itemTitle = v8->_itemTitle;
          v8->_itemTitle = v129;
        }

        else
        {
          id v131 = v12;
          v132 = (void *)objc_claimAutoreleasedReturnValue([v270 objectForKeyedSubscript:@"localizedName"]);
          uint64_t v133 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v132, v133) & 1) != 0) {
            id v134 = v132;
          }
          else {
            id v134 = 0LL;
          }
          itemTitle = (NSString *)v134;

          objc_storeStrong((id *)&v8->_itemTitle, v134);
          id v12 = v131;
          id v24 = v265;
        }

        v244 = v98;

        if (v264) {
          id v135 = v264;
        }
        else {
          id v135 = (id)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"ACTION_APPROVE"));
        }
        id v136 = v135;

        if (v262) {
          id v137 = v262;
        }
        else {
          id v137 = (id)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:]( &OBJC_CLASS___Localizations,  "stringWithKey:",  @"ACTION_DECLINE"));
        }
        id v138 = v137;

        v139 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"requesterFirstName"]);
        uint64_t v140 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v139, v140) & 1) != 0) {
          id v141 = v139;
        }
        else {
          id v141 = 0LL;
        }
        v142 = (__CFString *)v141;

        if (v142) {
          v143 = v142;
        }
        else {
          v143 = @"Unknown";
        }
        objc_storeStrong((id *)&v8->_requesterName, v143);

        v144 = (void *)objc_claimAutoreleasedReturnValue( +[Localizations stringWithKey:bag:]( &OBJC_CLASS___Localizations,  "stringWithKey:bag:",  @"NOTIFICATION_TITLE_APPROVER",  v7));
        v145 = v144;
        if (v144) {
          v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v144,  @"%@",  0LL,  v8->_requesterName));
        }
        id v146 = v144;

        id v262 = v138;
        id v264 = v136;
        v242 = v146;
        if (!v146)
        {
          int v55 = 1;
          id v20 = v266;
          v151 = v246;
LABEL_232:

          goto LABEL_233;
        }

        v147 = -[RequestLocalizations initWithApprove:body:decline:title:]( objc_alloc(&OBJC_CLASS___RequestLocalizations),  "initWithApprove:body:decline:title:",  v136,  v254,  v138,  v146);
        if (!v147)
        {
          int v55 = 1;
          id v20 = v266;
          v151 = v246;
LABEL_231:

          goto LABEL_232;
        }

        v241 = v147;
        objc_storeStrong((id *)&v8->_localizations, v147);
        uint64_t v148 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"priceString"]);
        uint64_t v149 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v148, v149) & 1) != 0) {
          id v150 = v148;
        }
        else {
          id v150 = 0LL;
        }
        v152 = (__CFString *)v150;

        if (v152) {
          v153 = v152;
        }
        else {
          v153 = @"Unknown";
        }
        objc_storeStrong((id *)&v8->_localizedPrice, v153);

        uint64_t v154 = (void *)objc_claimAutoreleasedReturnValue([v266 objectForKeyedSubscript:@"offerName"]);
        uint64_t v155 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v154, v155) & 1) != 0) {
          id v156 = v154;
        }
        else {
          id v156 = 0LL;
        }
        v157 = (__CFString *)v156;

        if (v157) {
          v158 = v157;
        }
        else {
          v158 = @"Unknown";
        }
        v240 = v158;

        objc_storeStrong((id *)&v8->_offerName, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"previewURL"]);
        uint64_t v160 = objc_opt_class(&OBJC_CLASS___NSString);
        v253 = v12;
        if ((objc_opt_isKindOfClass(v159, v160) & 1) != 0) {
          id v161 = v159;
        }
        else {
          id v161 = 0LL;
        }
        id v162 = v161;

        v239 = v162;
        if (v162)
        {
          previewURL = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v162));
          objc_storeStrong((id *)&v8->_previewURL, previewURL);
        }

        else
        {
          previewURL = v8->_previewURL;
          v8->_previewURL = 0LL;
        }

        p_productType = (void **)&v8->_productType;
        objc_storeStrong((id *)&v8->_productType, obj);
        v165 = (void *)objc_claimAutoreleasedReturnValue([v271 objectForKeyedSubscript:@"productTypeName"]);
        uint64_t v166 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v165, v166) & 1) != 0) {
          id v167 = v165;
        }
        else {
          id v167 = 0LL;
        }
        unsigned __int8 v168 = (__CFString *)v167;

        if (v168) {
          id v169 = v168;
        }
        else {
          id v169 = @"Unknown";
        }
        id v170 = v169;

        objc_storeStrong((id *)&v8->_productTypeName, v169);
        obja = v170;
        if ((-[__CFString isEqualToString:](v170, "isEqualToString:", @"Subscription") & 1) != 0)
        {
          v171 = @"SUB";
          unsigned __int8 v172 = &AKAppleIDAuthenticationErrorDomain_ptr;
        }

        else
        {
          unsigned __int8 v172 = &AKAppleIDAuthenticationErrorDomain_ptr;
          v171 = @"PUB";
        }

        id v173 = *p_productType;
        *p_productType = (void *)v171;

LABEL_174:
        v174 = (void *)objc_claimAutoreleasedReturnValue([v271 objectForKeyedSubscript:@"url"]);
        uint64_t v175 = objc_opt_class(v172[64]);
        if ((objc_opt_isKindOfClass(v174, v175) & 1) != 0) {
          id v176 = v174;
        }
        else {
          id v176 = 0LL;
        }
        id v177 = v176;

        v238 = v177;
        if (v177)
        {
          productURL = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v177));
          objc_storeStrong((id *)&v8->_productURL, productURL);
        }

        else
        {
          productURL = v8->_productURL;
          v8->_productURL = 0LL;
        }

        id v12 = v253;
        id v179 = (void *)objc_claimAutoreleasedReturnValue([v253 objectForKeyedSubscript:@"requesterDsId"]);
        uint64_t v180 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v179, v180) & 1) != 0) {
          id v181 = v179;
        }
        else {
          id v181 = 0LL;
        }
        id v182 = v181;

        uint64_t v183 = objc_claimAutoreleasedReturnValue([v182 stringValue]);
        requesterDSID = v8->_requesterDSID;
        v8->_requesterDSID = (NSString *)v183;

        objc_storeStrong((id *)&v8->_requestInfo, v257);
        id v185 = (void *)objc_claimAutoreleasedReturnValue([v253 objectForKeyedSubscript:@"approvalStatus"]);
        uint64_t v186 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v185, v186) & 1) != 0) {
          id v187 = v185;
        }
        else {
          id v187 = 0LL;
        }
        id v188 = v187;

        id v258 = v188;
        if (v188) {
          uint64_t v189 = (uint64_t)[v188 integerValue];
        }
        else {
          uint64_t v189 = -2LL;
        }
        v8->_int64_t status = v189;
        __int16 v190 = (void *)objc_claimAutoreleasedReturnValue([v266 objectForKeyedSubscript:@"userRating"]);
        uint64_t v191 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v190, v191) & 1) != 0) {
          id v192 = v190;
        }
        else {
          id v192 = 0LL;
        }
        id v193 = v192;

        if (v193)
        {
          id v194 = v193;
        }

        else
        {
          v195 = (void *)objc_claimAutoreleasedReturnValue([v269 objectForKeyedSubscript:@"userRating"]);
          uint64_t v196 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v195, v196) & 1) != 0) {
            id v197 = v195;
          }
          else {
            id v197 = 0LL;
          }
          id v198 = v197;

          id v194 = v198;
        }

        v199 = (void *)objc_claimAutoreleasedReturnValue([v194 objectForKeyedSubscript:@"value"]);
        uint64_t v200 = objc_opt_class(&OBJC_CLASS___NSNumber);
        v236 = v194;
        if ((objc_opt_isKindOfClass(v199, v200) & 1) != 0) {
          id v201 = v199;
        }
        else {
          id v201 = 0LL;
        }
        id v20 = v266;
        id v202 = v201;

        if (v202) {
          v203 = (_UNKNOWN **)v202;
        }
        else {
          v203 = &off_100032A78;
        }
        objc_storeStrong((id *)&v8->_starRating, v203);

        int64_t status = v8->_status;
        v237 = v182;
        if (!status)
        {
          v205 = @"declinedString";
          goto LABEL_208;
        }

        if (status == 1)
        {
          v205 = @"approvalString";
LABEL_208:
          id v206 = (id)objc_claimAutoreleasedReturnValue([v253 objectForKeyedSubscript:v205]);
          uint64_t v207 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v206, v207) & 1) != 0) {
            id v208 = v206;
          }
          else {
            id v208 = 0LL;
          }
          v212 = (__CFString *)v208;
          v213 = v212;
LABEL_214:
          v214 = v212;

          v213 = v214;
LABEL_215:
          if (v213) {
            v215 = v213;
          }
          else {
            v215 = &stru_100031BA0;
          }
          objc_storeStrong((id *)&v8->_itemDescription, v215);
          v216 = (void *)objc_claimAutoreleasedReturnValue([v271 objectForKeyedSubscript:@"coverArtImageUrl"]);
          uint64_t v217 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v216, v217) & 1) != 0) {
            id v218 = v216;
          }
          else {
            id v218 = 0LL;
          }
          id v219 = v218;

          if (v219)
          {
            v220 = (__CFString *)v219;
          }

          else
          {
            v221 = (void *)objc_claimAutoreleasedReturnValue([v270 objectForKeyedSubscript:@"coverArtImageUrl"]);
            uint64_t v222 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v221, v222) & 1) != 0) {
              id v223 = v221;
            }
            else {
              id v223 = 0LL;
            }
            id v224 = v223;

            v220 = (__CFString *)v224;
          }

          if (v220) {
            v225 = v220;
          }
          else {
            v225 = @"Unknown";
          }
          objc_storeStrong((id *)&v8->_thumbnailURLString, v225);

          int v55 = 0;
          id v24 = v265;
          v151 = v246;
          v147 = v241;
          goto LABEL_231;
        }

        v209 = (void *)objc_claimAutoreleasedReturnValue([v266 objectForKeyedSubscript:@"subtitle"]);
        uint64_t v210 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v209, v210) & 1) != 0) {
          id v211 = v209;
        }
        else {
          id v211 = 0LL;
        }
        id v228 = v211;

        if (v228)
        {
          v213 = (__CFString *)v228;
        }

        else
        {
          v229 = (void *)objc_claimAutoreleasedReturnValue([v269 objectForKeyedSubscript:@"subtitle"]);
          uint64_t v230 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v229, v230) & 1) != 0) {
            id v231 = v229;
          }
          else {
            id v231 = 0LL;
          }
          id v232 = v231;

          v213 = (__CFString *)v232;
          if (!v213)
          {
LABEL_247:
            v233 = (void *)objc_claimAutoreleasedReturnValue([v266 objectForKeyedSubscript:@"artistName"]);
            uint64_t v234 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v233, v234) & 1) != 0) {
              id v235 = v233;
            }
            else {
              id v235 = 0LL;
            }
            id v206 = v235;

            v212 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v206,  "stringByReplacingOccurrencesOfString:withString:",  @"&amp;",
                                     @"&"));
            goto LABEL_214;
          }
        }

        if (-[__CFString length](v213, "length")) {
          goto LABEL_215;
        }
        goto LABEL_247;
      }

      id v103 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543618;
      id v279 = v103;
      __int16 v280 = 2112;
      v281 = v250;
      uint64_t v104 = "%{public}@: Failed To Parse Created Date. String Value: \"%@\"";
      id v105 = (os_log_s *)v102;
      uint32_t v106 = 22;
    }

    else
    {
      id v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v101) {
        id v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v102 = (void *)objc_claimAutoreleasedReturnValue([v101 OSLogObject]);
      if (!os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_FAULT)) {
        goto LABEL_99;
      }
      id v103 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543362;
      id v279 = v103;
      uint64_t v104 = "%{public}@: Server Response Missing Created Date";
      id v105 = (os_log_s *)v102;
      uint32_t v106 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_FAULT, v104, buf, v106);

    goto LABEL_99;
  }

  int v55 = 1;
  id v20 = v266;
LABEL_234:
  id v56 = v271;

LABEL_235:
  if (!v55)
  {
LABEL_237:
    v226 = v8;
    goto LABEL_238;
  }

  v226 = 0LL;
LABEL_238:

  return v226;
}

+ (id)createUniqueIDFromRequestID:(id)a3 andCreatedDate:(id)a4
{
  id v6 = a3;
  [a4 timeIntervalSinceReferenceDate];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld_%@",  (uint64_t)v7,  v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class(a1);
    __int16 v15 = 2112;
    id v16 = v8;
    id v11 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Generated UniqueID from request: %@",  buf,  0x16u);
  }

  return v8;
}

- (void)updateStatus:(int64_t)a3 withApproverDSID:(id)a4
{
  self->_int64_t status = a3;
  objc_storeStrong((id *)&self->_approverDSID, a4);
}

- (BOOL)isSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productTypeName](self, "productTypeName"));
  unsigned __int8 v3 = [v2 isEqualToString:@"Subscription"];

  return v3;
}

- (id)metricsApp
{
  if (-[ApprovalRequest isSubscription](self, "isSubscription"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
    unint64_t v4 = +[ApprovalRequest lobForSubscription:](&OBJC_CLASS___ApprovalRequest, "lobForSubscription:", v3);

    if (v4 < 9)
    {
      v5 = &off_100030B88[v4];
      return *v5;
    }

    return @"xp_its_main";
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
    int64_t v7 = +[ApprovalRequest lobForProductType:](&OBJC_CLASS___ApprovalRequest, "lobForProductType:", v6);

    if ((unint64_t)(v7 - 1) < 3)
    {
      v5 = &off_100030BD0 + v7 - 1;
      return *v5;
    }

    return @"unknown";
  }

- (id)metricsTopic
{
  if (-[ApprovalRequest isSubscription](self, "isSubscription"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
    int64_t v4 = +[ApprovalRequest lobForSubscription:](&OBJC_CLASS___ApprovalRequest, "lobForSubscription:", v3);

    else {
      return *(&off_100030BE8 + v4 - 3);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
    int64_t v7 = +[ApprovalRequest lobForProductType:](&OBJC_CLASS___ApprovalRequest, "lobForProductType:", v6);

    uint64_t v8 = @"xp_its_main";
    if (v7 == 3) {
      uint64_t v8 = @"xp_its_music_main";
    }
    if (v7 == 1) {
      return @"xp_ase_appstore_ue";
    }
    else {
      return (id)v8;
    }
  }

- (int64_t)lineOfBusiness
{
  if (-[ApprovalRequest isSubscription](self, "isSubscription"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
    int64_t v4 = +[ApprovalRequest lobForSubscription:](&OBJC_CLASS___ApprovalRequest, "lobForSubscription:", v3);
  }

  else
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
    int64_t v4 = +[ApprovalRequest lobForProductType:](&OBJC_CLASS___ApprovalRequest, "lobForProductType:", v3);
  }

  int64_t v5 = v4;

  return v5;
}

+ (int64_t)lobForSubscription:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  if ([v3 isEqualToString:@"com.apple.tv"])
  {
    int64_t v4 = 8LL;
  }

  else
  {
    if ([v3 isEqualToString:@"com.apple.appleone"])
    {
      int64_t v4 = 6LL;
      goto LABEL_15;
    }

    if ([v3 isEqualToString:@"com.apple.fitness"])
    {
      int64_t v4 = 7LL;
      goto LABEL_15;
    }

    if ([v3 isEqualToString:@"com.apple.news"])
    {
      int64_t v4 = 4LL;
      goto LABEL_15;
    }

    if (!v3)
    {
LABEL_4:
      int64_t v4 = 3LL;
    }

    else if ([v3 isEqualToString:@"unknown"])
    {
      int64_t v4 = 3LL;
    }

    else
    {
      int64_t v4 = 0LL;
    }
  }

+ (int64_t)lobForProductType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"A"] & 1) != 0
    || ([v3 isEqualToString:@"ASB"] & 1) != 0
    || ([v3 isEqualToString:@"C"] & 1) != 0
    || ([v3 isEqualToString:@"G"] & 1) != 0)
  {
    int64_t v4 = 1LL;
  }

  else if (([v3 isEqualToString:@"P"] & 1) != 0 {
         || ([v3 isEqualToString:@"Q"] & 1) != 0
  }
         || ([v3 isEqualToString:@"S"] & 1) != 0
         || ([v3 isEqualToString:@"V"] & 1) != 0)
  {
    int64_t v4 = 3LL;
  }

  else
  {
    if (([v3 isEqualToString:@"B"] & 1) == 0
      && ([v3 isEqualToString:@"W"] & 1) == 0
      && ([v3 isEqualToString:@"PUB"] & 1) == 0)
    {
      [v3 isEqualToString:@"PC"];
    }

    int64_t v4 = 0LL;
  }

  return v4;
}

- (id)compile
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest createdDate](self, "createdDate"));
  [v4 timeIntervalSinceReferenceDate];
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v5,  @"createdTimeInterval");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest modifiedDate](self, "modifiedDate"));
  [v6 timeIntervalSinceReferenceDate];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v7,  @"modifiedTimeInterval");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v8, @"identifier");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest uniqueIdentifier](self, "uniqueIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v9, @"uniqueIdentifier");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemIdentifier](self, "itemIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v10, @"itemIdentifier");

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest ageRating](self, "ageRating"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v11, @"ageRating");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest approverDSID](self, "approverDSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v12, @"approverDSID");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v13, @"bundleID");

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ApprovalRequest canSendViaMessages](self, "canSendViaMessages")));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v14,  @"canSendViaMessages");

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemTitle](self, "itemTitle"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v15, @"itemTitle");

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemDescription](self, "itemDescription"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v16, @"itemDescription");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest localizations](self, "localizations"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 compile]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v18, @"localizations");

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest offerName](self, "offerName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v19, @"offerName");

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ApprovalRequest isMocked](self, "isMocked")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v20, @"mocked");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest localizedPrice](self, "localizedPrice"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v21, @"localizedPrice");

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest previewURL](self, "previewURL"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v23, @"previewURL");

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v24, @"productType");

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productTypeName](self, "productTypeName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v25, @"productTypeName");

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productURL](self, "productURL"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v27, @"productURL");

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest thumbnailURLString](self, "thumbnailURLString"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v28, @"thumbnailURL");

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requesterDSID](self, "requesterDSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v29, @"requesterDSID");

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requesterName](self, "requesterName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v30, @"requesterName");

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest starRating](self, "starRating"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v31, @"starRating");

  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[ApprovalRequest status](self, "status")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v32, @"status");

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requestString](self, "requestString"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v33, @"requestString");

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requestSummary](self, "requestSummary"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v34, @"requestSummary");

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest priceSummary](self, "priceSummary"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v35, @"priceSummary");

  return v3;
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest compile](self, "compile"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[ApprovalRequest ap_generateDescriptionWithSubObjects:]( self,  "ap_generateDescriptionWithSubObjects:",  v3));

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (NSString)approverDSID
{
  return self->_approverDSID;
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (NSString)itemBundleID
{
  return self->_itemBundleID;
}

- (BOOL)isMocked
{
  return self->_mocked;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (NSNumber)starRating
{
  return self->_starRating;
}

- (NSString)requestString
{
  return self->_requestString;
}

- (NSString)requestSummary
{
  return self->_requestSummary;
}

- (NSString)priceSummary
{
  return self->_priceSummary;
}

- (void).cxx_destruct
{
}

@end