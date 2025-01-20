@interface ApproverStoreItem
- (ApproverStoreItem)initWithDictionary:(id)a3;
- (ApproverStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 date:(id)a6;
- (ApproverStoreItem)initWithRequest:(id)a3 date:(id)a4;
- (BOOL)canSendViaMessages;
- (NSDate)createdDate;
- (NSDate)modifiedDate;
- (NSDictionary)requestInfo;
- (NSNumber)starRating;
- (NSString)ageRating;
- (NSString)approverDSID;
- (NSString)itemBundleID;
- (NSString)itemDescription;
- (NSString)itemIdentifier;
- (NSString)itemTitle;
- (NSString)localizedPrice;
- (NSString)offerName;
- (NSString)priceSummary;
- (NSString)productType;
- (NSString)requestIdentifier;
- (NSString)requestString;
- (NSString)requestSummary;
- (NSString)requesterDSID;
- (NSString)requesterName;
- (NSString)thumbnailURLString;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (RequestLocalizations)localizations;
- (id)compile;
- (id)description;
- (int64_t)status;
- (void)setAgeRating:(id)a3;
- (void)setApproverDSID:(id)a3;
- (void)setItemBundleID:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setLocalizedPrice:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setOfferName:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setRequesterName:(id)a3;
- (void)setStarRating:(id)a3;
- (void)setThumbnailURLString:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation ApproverStoreItem

- (ApproverStoreItem)initWithRequest:(id)a3 date:(id)a4
{
  id v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___ApproverStoreItem;
  v6 = -[ApproverStoreItem init](&v54, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 ageRating]);
    ageRating = v6->_ageRating;
    v6->_ageRating = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 approverDSID]);
    approverDSID = v6->_approverDSID;
    v6->_approverDSID = (NSString *)v9;

    v6->_canSendViaMessages = [v5 canSendViaMessages];
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 createdDate]);
    createdDate = v6->_createdDate;
    v6->_createdDate = (NSDate *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 modifiedDate]);
    modifiedDate = v6->_modifiedDate;
    v6->_modifiedDate = (NSDate *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 itemIdentifier]);
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 requestIdentifier]);
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSString *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue([v5 itemTitle]);
    itemTitle = v6->_itemTitle;
    v6->_itemTitle = (NSString *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue([v5 itemDescription]);
    itemDescription = v6->_itemDescription;
    v6->_itemDescription = (NSString *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue([v5 localizedPrice]);
    localizedPrice = v6->_localizedPrice;
    v6->_localizedPrice = (NSString *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue([v5 itemBundleID]);
    itemBundleID = v6->_itemBundleID;
    v6->_itemBundleID = (NSString *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v5 localizations]);
    localizations = v6->_localizations;
    v6->_localizations = (RequestLocalizations *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue([v5 offerName]);
    offerName = v6->_offerName;
    v6->_offerName = (NSString *)v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue([v5 previewURL]);
    previewURL = v6->_previewURL;
    v6->_previewURL = (NSURL *)v33;

    uint64_t v35 = objc_claimAutoreleasedReturnValue([v5 productType]);
    productType = v6->_productType;
    v6->_productType = (NSString *)v35;

    uint64_t v37 = objc_claimAutoreleasedReturnValue([v5 thumbnailURLString]);
    thumbnailURLString = v6->_thumbnailURLString;
    v6->_thumbnailURLString = (NSString *)v37;

    uint64_t v39 = objc_claimAutoreleasedReturnValue([v5 requesterDSID]);
    requesterDSID = v6->_requesterDSID;
    v6->_requesterDSID = (NSString *)v39;

    uint64_t v41 = objc_claimAutoreleasedReturnValue([v5 requesterName]);
    requesterName = v6->_requesterName;
    v6->_requesterName = (NSString *)v41;

    uint64_t v43 = objc_claimAutoreleasedReturnValue([v5 requestInfo]);
    requestInfo = v6->_requestInfo;
    v6->_requestInfo = (NSDictionary *)v43;

    uint64_t v45 = objc_claimAutoreleasedReturnValue([v5 starRating]);
    starRating = v6->_starRating;
    v6->_starRating = (NSNumber *)v45;

    v6->_status = (int64_t)[v5 status];
    uint64_t v47 = objc_claimAutoreleasedReturnValue([v5 requestString]);
    requestString = v6->_requestString;
    v6->_requestString = (NSString *)v47;

    uint64_t v49 = objc_claimAutoreleasedReturnValue([v5 requestSummary]);
    requestSummary = v6->_requestSummary;
    v6->_requestSummary = (NSString *)v49;

    uint64_t v51 = objc_claimAutoreleasedReturnValue([v5 priceSummary]);
    priceSummary = v6->_priceSummary;
    v6->_priceSummary = (NSString *)v51;
  }

  return v6;
}

- (ApproverStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ApproverStoreItem;
  uint64_t v15 = -[ApproverStoreItem init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemIdentifier, a3);
    objc_storeStrong((id *)&v16->_requestIdentifier, a4);
    objc_storeStrong((id *)&v16->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v16->_createdDate, a6);
  }

  return v16;
}

- (ApproverStoreItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v177.receiver = self;
  v177.super_class = (Class)&OBJC_CLASS___ApproverStoreItem;
  id v5 = -[ApproverStoreItem init](&v177, "init");

  if (!v5)
  {
LABEL_108:
    v69 = v5;
    goto LABEL_109;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemIdentifier"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = v6;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    if (!v9) {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
      id v12 = NSStringFromClass(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v14 = (objc_class *)objc_opt_class(v6);
      uint64_t v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543874;
      v179 = @"itemIdentifier";
      __int16 v180 = 2114;
      v181 = v13;
      __int16 v182 = 2114;
      v183 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.",  buf,  0x20u);
    }

    id v8 = 0LL;
  }

  v174 = v8;
  id v17 = v8;

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestIdentifier"]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
  v175 = v17;
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
  {
    id v20 = v18;
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    if (!v21) {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      uint64_t v23 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
      v24 = NSStringFromClass(v23);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (objc_class *)objc_opt_class(v18);
      uint64_t v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138543874;
      v179 = @"requestIdentifier";
      __int16 v180 = 2114;
      v181 = v25;
      __int16 v182 = 2114;
      v183 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.",  buf,  0x20u);

      id v17 = v175;
    }

    id v20 = 0LL;
  }

  v173 = v20;
  id v176 = v20;

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uniqueIdentifier"]);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
  {
    id v31 = v29;
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    if (!v32) {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      v34 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v35 = NSStringFromClass(v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      uint64_t v37 = (objc_class *)objc_opt_class(v29);
      v38 = NSStringFromClass(v37);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      *(_DWORD *)buf = 138543874;
      v179 = @"uniqueIdentifier";
      __int16 v180 = 2114;
      v181 = v36;
      __int16 v182 = 2114;
      v183 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.",  buf,  0x20u);

      id v17 = v175;
    }

    id v31 = 0LL;
  }

  v172 = v31;
  id v40 = v31;

  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"createdTimeInterval"]);
  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
  {
    id v43 = v41;
  }

  else
  {
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v41, v44) & 1) != 0)
    {
      [v41 doubleValue];
      id v43 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    }

    else
    {
      id v45 = v40;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      if (!v46) {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v46 OSLogObject]);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        v48 = (objc_class *)objc_opt_class(v41);
        uint64_t v49 = NSStringFromClass(v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        *(_DWORD *)buf = 138543618;
        v179 = @"createdTimeInterval";
        __int16 v180 = 2114;
        v181 = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.",  buf,  0x16u);

        id v17 = v175;
      }

      id v43 = 0LL;
      id v40 = v45;
    }
  }

  v171 = v43;
  id v51 = v43;

  v52 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"modifiedTimeInterval"]);
  uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
  {
    id v54 = v52;
LABEL_36:
    v56 = v54;
    v57 = &AKAppleIDAuthenticationErrorDomain_ptr;
    goto LABEL_42;
  }

  uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v52, v55) & 1) != 0)
  {
    [v52 doubleValue];
    id v54 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_36;
  }

  id v58 = v51;
  id v59 = v40;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  if (!v60) {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
  v57 = &AKAppleIDAuthenticationErrorDomain_ptr;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
  {
    v62 = (objc_class *)objc_opt_class(v52);
    v63 = NSStringFromClass(v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    *(_DWORD *)buf = 138543618;
    v179 = @"modifiedTimeInterval";
    __int16 v180 = 2114;
    v181 = v64;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_FAULT,  "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.",  buf,  0x16u);

    id v17 = v175;
  }

  id v40 = v59;
  id v51 = v58;
  v56 = 0LL;
LABEL_42:
  id v65 = v56;

  if (v17 && v176 && v51 && v40)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ageRating"]);
    uint64_t v67 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0) {
      id v68 = v66;
    }
    else {
      id v68 = 0LL;
    }
    id v165 = v56;
    id obj = v68;
    id v70 = v68;

    v71 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"canSendViaMessages"]);
    uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v71, v72) & 1) != 0) {
      id v73 = v71;
    }
    else {
      id v73 = 0LL;
    }
    id v74 = v73;

    v75 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"approverDSID"]);
    uint64_t v76 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v75, v76) & 1) != 0) {
      id v77 = v75;
    }
    else {
      id v77 = 0LL;
    }
    id v158 = v77;
    id v166 = v77;

    v78 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemBundleID"]);
    uint64_t v79 = objc_opt_class(v57[64]);
    v168 = v65;
    if ((objc_opt_isKindOfClass(v78, v79) & 1) != 0) {
      id v80 = v78;
    }
    else {
      id v80 = 0LL;
    }
    id v164 = v80;

    v81 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"localizations"]);
    uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v160 = v80;
    if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0) {
      id v83 = v81;
    }
    else {
      id v83 = 0LL;
    }
    id v84 = v83;

    v163 = v84;
    v85 = -[RequestLocalizations initWithDictionary:]( objc_alloc(&OBJC_CLASS___RequestLocalizations),  "initWithDictionary:",  v84);
    v86 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"price"]);
    uint64_t v87 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v86, v87) & 1) != 0) {
      id v88 = v86;
    }
    else {
      id v88 = 0LL;
    }
    id v155 = v88;
    id v159 = v88;

    v89 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"offerName"]);
    uint64_t v90 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v89, v90) & 1) != 0) {
      id v91 = v89;
    }
    else {
      id v91 = 0LL;
    }
    id v153 = v91;
    id v157 = v91;

    v92 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"previewURL"]);
    uint64_t v93 = objc_opt_class(&OBJC_CLASS___NSURL);
    if ((objc_opt_isKindOfClass(v92, v93) & 1) != 0) {
      id v94 = v92;
    }
    else {
      id v94 = 0LL;
    }
    id v151 = v94;
    id v156 = v94;

    v95 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productType"]);
    uint64_t v96 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v95, v96) & 1) != 0) {
      id v97 = v95;
    }
    else {
      id v97 = 0LL;
    }
    id v150 = v97;
    id v154 = v97;

    v98 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemTitle"]);
    uint64_t v99 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v98, v99) & 1) != 0) {
      id v100 = v98;
    }
    else {
      id v100 = 0LL;
    }
    id v147 = v100;
    id v152 = v100;

    v101 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemDescription"]);
    uint64_t v102 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v101, v102) & 1) != 0) {
      id v103 = v101;
    }
    else {
      id v103 = 0LL;
    }
    id v145 = v103;
    id v149 = v103;

    v104 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"thumbnailURL"]);
    uint64_t v105 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v104, v105) & 1) != 0) {
      id v106 = v104;
    }
    else {
      id v106 = 0LL;
    }
    id v144 = v106;
    id v148 = v106;

    v107 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requesterName"]);
    uint64_t v108 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v107, v108) & 1) != 0) {
      id v109 = v107;
    }
    else {
      id v109 = 0LL;
    }
    id v142 = v109;
    id v146 = v109;

    v110 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requesterDSID"]);
    uint64_t v111 = objc_opt_class(v57[64]);
    if ((objc_opt_isKindOfClass(v110, v111) & 1) != 0) {
      id v112 = v110;
    }
    else {
      id v112 = 0LL;
    }
    id v140 = v112;
    id v143 = v112;

    v113 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestInfo"]);
    uint64_t v114 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v113, v114) & 1) != 0) {
      id v115 = v113;
    }
    else {
      id v115 = 0LL;
    }
    id v139 = v115;
    id v141 = v115;

    v116 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"starRating"]);
    uint64_t v117 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v116, v117) & 1) != 0) {
      id v118 = v116;
    }
    else {
      id v118 = 0LL;
    }
    id v137 = v118;
    id v138 = v118;

    v119 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"status"]);
    uint64_t v120 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v167 = v70;
    if ((objc_opt_isKindOfClass(v119, v120) & 1) != 0) {
      id v121 = v119;
    }
    else {
      id v121 = 0LL;
    }
    id v122 = v121;

    v123 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestString"]);
    uint64_t v124 = objc_opt_class(v57[64]);
    v169 = v51;
    v170 = v40;
    v161 = v85;
    if ((objc_opt_isKindOfClass(v123, v124) & 1) != 0) {
      id v125 = v123;
    }
    else {
      id v125 = 0LL;
    }
    id v126 = v125;

    v127 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestSummary"]);
    uint64_t v128 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v127, v128) & 1) != 0) {
      id v129 = v127;
    }
    else {
      id v129 = 0LL;
    }
    id v130 = v129;

    v131 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"priceSummary"]);
    uint64_t v132 = objc_opt_class(&OBJC_CLASS___NSString);
    v136 = v126;
    if ((objc_opt_isKindOfClass(v131, v132) & 1) != 0) {
      id v133 = v131;
    }
    else {
      id v133 = 0LL;
    }
    id v134 = v133;

    objc_storeStrong((id *)&v5->_ageRating, obj);
    objc_storeStrong((id *)&v5->_approverDSID, v158);
    v5->_canSendViaMessages = [v74 BOOLValue];
    objc_storeStrong((id *)&v5->_createdDate, v171);
    objc_storeStrong((id *)&v5->_modifiedDate, v165);
    objc_storeStrong((id *)&v5->_itemIdentifier, v174);
    objc_storeStrong((id *)&v5->_requestIdentifier, v173);
    objc_storeStrong((id *)&v5->_uniqueIdentifier, v172);
    objc_storeStrong((id *)&v5->_itemTitle, v147);
    objc_storeStrong((id *)&v5->_itemDescription, v145);
    objc_storeStrong((id *)&v5->_localizations, v161);
    objc_storeStrong((id *)&v5->_localizedPrice, v155);
    objc_storeStrong((id *)&v5->_offerName, v153);
    objc_storeStrong((id *)&v5->_previewURL, v151);
    objc_storeStrong((id *)&v5->_productType, v150);
    objc_storeStrong((id *)&v5->_itemBundleID, v160);
    objc_storeStrong((id *)&v5->_thumbnailURLString, v144);
    objc_storeStrong((id *)&v5->_requesterDSID, v140);
    objc_storeStrong((id *)&v5->_requesterName, v142);
    objc_storeStrong((id *)&v5->_requestInfo, v139);
    objc_storeStrong((id *)&v5->_starRating, v137);
    v5->_status = (int64_t)[v122 integerValue];
    objc_storeStrong((id *)&v5->_requestString, v125);
    objc_storeStrong((id *)&v5->_requestSummary, v129);
    objc_storeStrong((id *)&v5->_priceSummary, v133);

    goto LABEL_108;
  }

  v69 = 0LL;
LABEL_109:

  return v69;
}

- (id)compile
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem itemIdentifier](self, "itemIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v4, @"itemIdentifier");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requestIdentifier](self, "requestIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v5,  @"requestIdentifier");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem uniqueIdentifier](self, "uniqueIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v6, @"uniqueIdentifier");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem createdDate](self, "createdDate"));
  [v7 timeIntervalSinceReferenceDate];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v8,  @"createdTimeInterval");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem modifiedDate](self, "modifiedDate"));
  [v9 timeIntervalSinceReferenceDate];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v10,  @"modifiedTimeInterval");

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem ageRating](self, "ageRating"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v11, @"ageRating");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem approverDSID](self, "approverDSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v12, @"approverDSID");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem itemBundleID](self, "itemBundleID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v13, @"itemBundleID");

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ApproverStoreItem canSendViaMessages](self, "canSendViaMessages")));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v14,  @"canSendViaMessages");

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem itemTitle](self, "itemTitle"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v15, @"itemTitle");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem itemDescription](self, "itemDescription"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v16, @"itemDescription");

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem localizations](self, "localizations"));
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 compile]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v18, @"localizations");

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem localizedPrice](self, "localizedPrice"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v19, @"price");

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem offerName](self, "offerName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v20, @"offerName");

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem previewURL](self, "previewURL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v22, @"previewURL");

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem productType](self, "productType"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v23, @"productType");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem thumbnailURLString](self, "thumbnailURLString"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v24, @"thumbnailURL");

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requesterName](self, "requesterName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v25, @"requesterName");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requesterDSID](self, "requesterDSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v26, @"requesterDSID");

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requestInfo](self, "requestInfo"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v27, @"requestInfo");

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem starRating](self, "starRating"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v28, @"starRating");

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[ApproverStoreItem status](self, "status")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v29, @"status");

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requestString](self, "requestString"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v30, @"requestString");

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requestSummary](self, "requestSummary"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v31, @"requestSummary");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem priceSummary](self, "priceSummary"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v32, @"priceSummary");

  return v3;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem compile](self, "compile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ApproverStoreItem ap_generateDescriptionWithSubObjects:]( self,  "ap_generateDescriptionWithSubObjects:",  v3));

  return v4;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(id)a3
{
}

- (NSString)approverDSID
{
  return self->_approverDSID;
}

- (void)setApproverDSID:(id)a3
{
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (void)setLocalizedPrice:(id)a3
{
}

- (NSString)itemBundleID
{
  return self->_itemBundleID;
}

- (void)setItemBundleID:(id)a3
{
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (void)setOfferName:(id)a3
{
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (void)setThumbnailURLString:(id)a3
{
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (void)setRequesterName:(id)a3
{
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (NSNumber)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
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