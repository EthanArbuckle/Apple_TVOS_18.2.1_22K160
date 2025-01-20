@interface RequestStoreItem
- (NSDate)createdDate;
- (NSDate)modifiedDate;
- (NSNumber)starRating;
- (NSString)ageRating;
- (NSString)approverDSID;
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
- (NSString)thumbnailURLString;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (NSURL)productURL;
- (RequestLocalizations)localizations;
- (RequestStoreItem)initWithDictionary:(id)a3;
- (RequestStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 ageRating:(id)a6 approverDSID:(id)a7 requesterDSID:(id)a8 createdDate:(id)a9 modifiedDate:(id)a10 itemDesc:(id)a11 itemTitle:(id)a12 localizedPrice:(id)a13 previewURL:(id)a14 productType:(id)a15 productTypeName:(id)a16 productURL:(id)a17 offerName:(id)a18 requestString:(id)a19 requestSummary:(id)a20 priceSummary:(id)a21 status:(int64_t)a22 starRating:(id)a23 thumbnailURLString:(id)a24;
- (RequestStoreItem)initWithRequest:(id)a3;
- (id)compile;
- (id)description;
- (int64_t)status;
- (void)setAgeRating:(id)a3;
- (void)setApproverDSID:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setLocalizations:(id)a3;
- (void)setLocalizedPrice:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setOfferName:(id)a3;
- (void)setPriceSummary:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestString:(id)a3;
- (void)setRequestSummary:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setStarRating:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setThumbnailURLString:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation RequestStoreItem

- (RequestStoreItem)initWithItemIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 ageRating:(id)a6 approverDSID:(id)a7 requesterDSID:(id)a8 createdDate:(id)a9 modifiedDate:(id)a10 itemDesc:(id)a11 itemTitle:(id)a12 localizedPrice:(id)a13 previewURL:(id)a14 productType:(id)a15 productTypeName:(id)a16 productURL:(id)a17 offerName:(id)a18 requestString:(id)a19 requestSummary:(id)a20 priceSummary:(id)a21 status:(int64_t)a22 starRating:(id)a23 thumbnailURLString:(id)a24
{
  id v54 = a3;
  id v53 = a4;
  id v52 = a5;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  id v38 = a17;
  id v40 = a18;
  id v39 = a19;
  id v37 = a20;
  id v36 = a21;
  id v35 = a23;
  id v34 = a24;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___RequestStoreItem;
  v29 = -[RequestStoreItem init](&v55, "init");
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_ageRating, a6);
    objc_storeStrong((id *)&v30->_approverDSID, a7);
    objc_storeStrong((id *)&v30->_createdDate, a9);
    objc_storeStrong((id *)&v30->_itemDescription, a11);
    objc_storeStrong((id *)&v30->_itemIdentifier, a3);
    objc_storeStrong((id *)&v30->_itemTitle, a12);
    objc_storeStrong((id *)&v30->_localizedPrice, a13);
    objc_storeStrong((id *)&v30->_modifiedDate, a10);
    objc_storeStrong((id *)&v30->_offerName, a18);
    objc_storeStrong((id *)&v30->_previewURL, a14);
    objc_storeStrong((id *)&v30->_priceSummary, a21);
    objc_storeStrong((id *)&v30->_productType, a15);
    objc_storeStrong((id *)&v30->_productTypeName, a16);
    objc_storeStrong((id *)&v30->_productURL, a17);
    objc_storeStrong((id *)&v30->_requestIdentifier, a4);
    objc_storeStrong((id *)&v30->_requestString, a19);
    objc_storeStrong((id *)&v30->_requestSummary, a20);
    objc_storeStrong((id *)&v30->_requesterDSID, a8);
    objc_storeStrong((id *)&v30->_starRating, a23);
    v30->_status = a22;
    objc_storeStrong((id *)&v30->_thumbnailURLString, a24);
    objc_storeStrong((id *)&v30->_uniqueIdentifier, a5);
  }

  return v30;
}

- (RequestStoreItem)initWithRequest:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___RequestStoreItem;
  v5 = -[RequestStoreItem init](&v49, "init");
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

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 itemDescription]);
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 itemIdentifier]);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 itemTitle]);
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 localizedPrice]);
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 modifiedDate]);
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 offerName]);
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 previewURL]);
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 priceSummary]);
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 productType]);
    productType = v5->_productType;
    v5->_productType = (NSString *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 productTypeName]);
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue([v4 productURL]);
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue([v4 requestString]);
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 requestSummary]);
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 requesterDSID]);
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v40;

    uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 starRating]);
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v42;

    v5->_status = (int64_t)[v4 status];
    uint64_t v44 = objc_claimAutoreleasedReturnValue([v4 thumbnailURLString]);
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v46;
  }

  return v5;
}

- (RequestStoreItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ageRating"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"approverDSID"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v104 = v8;
  }
  else {
    id v104 = 0LL;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requesterDSID"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v102 = v10;
  }
  else {
    id v102 = 0LL;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemDescription"]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    id v14 = v12;
  }
  else {
    id v14 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemTitle"]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
    id v100 = v15;
  }
  else {
    id v100 = 0LL;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"localizedPrice"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
  v110 = self;
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
    id v19 = v17;
  }
  else {
    id v19 = 0LL;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"previewURL"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    id v22 = v20;
LABEL_23:
    v111 = v22;
    goto LABEL_25;
  }

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v20, v23) & 1) != 0)
  {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
    goto LABEL_23;
  }

  v111 = 0LL;
LABEL_25:

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productType"]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    id v107 = v24;
  }
  else {
    id v107 = 0LL;
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productTypeName"]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
    id v28 = v26;
  }
  else {
    id v28 = 0LL;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productURL"]);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
  {
    id v31 = v29;
LABEL_35:
    id v33 = v31;
    goto LABEL_37;
  }

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v29, v32) & 1) != 0)
  {
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v29));
    goto LABEL_35;
  }

  id v33 = 0LL;
LABEL_37:

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"starRating"]);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
    id v36 = v34;
  }
  else {
    id v36 = 0LL;
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"thumbnailURLString"]);
  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0) {
    id v103 = v37;
  }
  else {
    id v103 = 0LL;
  }

  id v39 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemIdentifier"]);
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0) {
    id v109 = v39;
  }
  else {
    id v109 = 0LL;
  }

  id v41 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestIdentifier"]);
  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0) {
    id v43 = v41;
  }
  else {
    id v43 = 0LL;
  }
  v108 = v19;

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uniqueIdentifier"]);
  uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString);
  v105 = v7;
  v106 = v33;
  if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0) {
    id v99 = v44;
  }
  else {
    id v99 = 0LL;
  }
  id v46 = v36;

  id v47 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"createdTimeInterval"]);
  uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
  {
    id v49 = v47;
LABEL_56:
    id v97 = v49;
    goto LABEL_58;
  }

  uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v47, v50) & 1) != 0)
  {
    [v47 doubleValue];
    id v49 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_56;
  }

  id v97 = 0LL;
LABEL_58:

  id v51 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"modifiedTimeInterval"]);
  uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0)
  {
    id v53 = v51;
LABEL_62:
    id v55 = v53;
    goto LABEL_64;
  }

  uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v51, v54) & 1) != 0)
  {
    [v51 doubleValue];
    id v53 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_62;
  }

  id v55 = 0LL;
LABEL_64:

  v56 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"offerName"]);
  uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0) {
    id v93 = v56;
  }
  else {
    id v93 = 0LL;
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestString"]);
  uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0) {
    id v95 = v58;
  }
  else {
    id v95 = 0LL;
  }
  id v60 = v43;
  v96 = v55;

  v61 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestSummary"]);
  uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString);
  id v63 = v14;
  if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0) {
    id v64 = v61;
  }
  else {
    id v64 = 0LL;
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"priceSummary"]);
  uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v65, v66) & 1) != 0) {
    id v67 = v65;
  }
  else {
    id v67 = 0LL;
  }
  id v94 = v64;

  v68 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"status"]);
  uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSNumber);
  v70 = v100;
  if ((objc_opt_isKindOfClass(v68, v69) & 1) != 0) {
    id v71 = v68;
  }
  else {
    id v71 = 0LL;
  }

  v72 = 0LL;
  v98 = v4;
  v92 = v63;
  v90 = v46;
  v91 = v28;
  v89 = v60;
  if (!v109 || !v60)
  {
    v81 = v109;
    v83 = v99;
    v82 = v97;
LABEL_85:
    v77 = v95;
    v80 = v96;
    v74 = v71;
    v75 = v67;
    v79 = v93;
    v76 = v94;
    goto LABEL_86;
  }

  if (!v97)
  {
    v81 = v109;
    v82 = 0LL;
    v83 = v99;
    goto LABEL_85;
  }

  id v73 = [v71 integerValue];
  id v88 = v46;
  id v87 = v67;
  v74 = v71;
  v75 = v67;
  v76 = v94;
  v77 = v95;
  id v78 = v60;
  id v86 = v28;
  v79 = v93;
  v80 = v96;
  id v85 = v63;
  v81 = v109;
  v82 = v97;
  v83 = v99;
  v72 =  -[RequestStoreItem initWithItemIdentifier:requestIdentifier:uniqueIdentifier:ageRating:approverDSID:requesterDSID:createdDate:modifiedDate:itemDesc:itemTitle:localizedPrice:previewURL:productType:productTypeName:productURL:offerName:requestString:requestSummary:priceSummary:status:starRating:thumbnailURLString:]( v110,  "initWithItemIdentifier:requestIdentifier:uniqueIdentifier:ageRating:approverDSID:requesterDSID:createdDate:m odifiedDate:itemDesc:itemTitle:localizedPrice:previewURL:productType:productTypeName:productURL:offerName:re questString:requestSummary:priceSummary:status:starRating:thumbnailURLString:",  v109,  v78,  v99,  v105,  v104,  v102,  v97,  v96,  v85,  v100,  v108,  v111,  v107,  v86,  v106,  v93,  v95,  v94,  v87,  v73,  v88,  v103);
  v110 = v72;
LABEL_86:
  v101 = v72;

  return v101;
}

- (id)compile
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem ageRating](self, "ageRating"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v4, @"ageRating");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem approverDSID](self, "approverDSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v5, @"approverDSID");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem requesterDSID](self, "requesterDSID"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v6, @"requesterDSID");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem itemDescription](self, "itemDescription"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v7, @"itemDescription");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem itemTitle](self, "itemTitle"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v8, @"itemTitle");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem localizedPrice](self, "localizedPrice"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v9, @"localizedPrice");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem previewURL](self, "previewURL"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v11, @"previewURL");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem productType](self, "productType"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v12, @"productType");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem productTypeName](self, "productTypeName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v13, @"productTypeName");

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem productURL](self, "productURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v15, @"productURL");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem starRating](self, "starRating"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v16, @"starRating");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem thumbnailURLString](self, "thumbnailURLString"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v17,  @"thumbnailURLString");

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem itemIdentifier](self, "itemIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v18, @"itemIdentifier");

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem localizations](self, "localizations"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 compile]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v20, @"localizations");

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem offerName](self, "offerName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v21, @"offerName");

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem requestIdentifier](self, "requestIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v22,  @"requestIdentifier");

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[RequestStoreItem status](self, "status")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v23, @"status");

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem uniqueIdentifier](self, "uniqueIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v24,  @"uniqueIdentifier");

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem createdDate](self, "createdDate"));
  [v25 timeIntervalSinceReferenceDate];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v26,  @"createdTimeInterval");

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem modifiedDate](self, "modifiedDate"));
  [v27 timeIntervalSinceReferenceDate];
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v28,  @"modifiedTimeInterval");

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem requestString](self, "requestString"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v29, @"requestString");

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem requestSummary](self, "requestSummary"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v30, @"requestSummary");

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem priceSummary](self, "priceSummary"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v31, @"priceSummary");

  return v3;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem compile](self, "compile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[RequestStoreItem ap_generateDescriptionWithSubObjects:]( self,  "ap_generateDescriptionWithSubObjects:",  v3));

  return v4;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
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

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
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

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (void)setLocalizations:(id)a3
{
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (void)setLocalizedPrice:(id)a3
{
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

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
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

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (void)setThumbnailURLString:(id)a3
{
}

- (NSString)requestString
{
  return self->_requestString;
}

- (void)setRequestString:(id)a3
{
}

- (NSString)requestSummary
{
  return self->_requestSummary;
}

- (void)setRequestSummary:(id)a3
{
}

- (NSString)priceSummary
{
  return self->_priceSummary;
}

- (void)setPriceSummary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end