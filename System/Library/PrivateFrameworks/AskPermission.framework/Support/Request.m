@interface Request
- (BOOL)isMocked;
- (NSDate)date;
- (NSDictionary)requestInfo;
- (NSString)description;
- (NSString)itemBundleIdentifier;
- (NSString)itemIdentifier;
- (NSString)offerName;
- (NSString)productType;
- (NSString)productTypeName;
- (NSString)requestIdentifier;
- (NSString)uniqueIdentifier;
- (NSURL)previewURL;
- (NSURL)productURL;
- (Request)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemBundleIdentifier:(id)a6 itemIdentifier:(id)a7 localizations:(id)a8 mocked:(BOOL)a9 offerName:(id)a10 previewURL:(id)a11 productType:(id)a12 productTypeName:(id)a13 productURL:(id)a14 requestInfo:(id)a15 status:(int64_t)a16;
- (Request)initWithDictionary:(id)a3;
- (RequestLocalizations)localizations;
- (id)compile;
- (int64_t)status;
@end

@implementation Request

- (Request)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemBundleIdentifier:(id)a6 itemIdentifier:(id)a7 localizations:(id)a8 mocked:(BOOL)a9 offerName:(id)a10 previewURL:(id)a11 productType:(id)a12 productTypeName:(id)a13 productURL:(id)a14 requestInfo:(id)a15 status:(int64_t)a16
{
  id v41 = a3;
  id v32 = a4;
  id v39 = a4;
  id v33 = a5;
  id v37 = a5;
  id v34 = a6;
  id v21 = a6;
  id v35 = a7;
  id v22 = a7;
  id v40 = a8;
  id v38 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___Request;
  v28 = -[Request init](&v42, "init");
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_date, a3);
    objc_storeStrong((id *)&v29->_requestIdentifier, v32);
    objc_storeStrong((id *)&v29->_uniqueIdentifier, v33);
    objc_storeStrong((id *)&v29->_itemBundleIdentifier, v34);
    objc_storeStrong((id *)&v29->_itemIdentifier, v35);
    objc_storeStrong((id *)&v29->_localizations, a8);
    v29->_mocked = a9;
    objc_storeStrong((id *)&v29->_offerName, a10);
    objc_storeStrong((id *)&v29->_previewURL, a11);
    objc_storeStrong((id *)&v29->_productType, a12);
    objc_storeStrong((id *)&v29->_productTypeName, a13);
    objc_storeStrong((id *)&v29->_productURL, a14);
    objc_storeStrong((id *)&v29->_requestInfo, a15);
    v29->_status = a16;
  }

  return v29;
}

- (Request)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"date"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
LABEL_5:
    v73 = v7;
    goto LABEL_7;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    [v5 doubleValue];
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_5;
  }

  v73 = 0LL;
LABEL_7:

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"identifier"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    id v72 = v9;
  }
  else {
    id v72 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uniqueIdentifier"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    id v68 = v11;
  }
  else {
    id v68 = 0LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemIdentifier"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
    id v15 = v13;
  }
  else {
    id v15 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemBundleIdentifier"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
    id v18 = v16;
  }
  else {
    id v18 = 0LL;
  }
  id v65 = v18;

  v19 = objc_alloc(&OBJC_CLASS___RequestLocalizations);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"localizations"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
    id v22 = v20;
  }
  else {
    id v22 = 0LL;
  }

  v67 = -[RequestLocalizations initWithDictionary:](v19, "initWithDictionary:", v22);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mocked"]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
    id v25 = v23;
  }
  else {
    id v25 = 0LL;
  }

  unsigned __int8 v62 = [v25 BOOLValue];
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"offerName"]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
  v71 = self;
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
    id v28 = v26;
  }
  else {
    id v28 = 0LL;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"previewURL"]);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
  {
    id v31 = v29;
LABEL_32:
    id v33 = v31;
    goto LABEL_34;
  }

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v29, v32) & 1) != 0)
  {
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v29));
    goto LABEL_32;
  }

  id v33 = 0LL;
LABEL_34:

  id v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productType"]);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
    id v36 = v34;
  }
  else {
    id v36 = 0LL;
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productTypeName"]);
  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString);
  id v64 = v28;
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0) {
    id v39 = v37;
  }
  else {
    id v39 = 0LL;
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productURL"]);
  uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
  {
    id v42 = v40;
LABEL_44:
    v44 = v42;
    goto LABEL_46;
  }

  uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v40, v43) & 1) != 0)
  {
    id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v40));
    goto LABEL_44;
  }

  v44 = 0LL;
LABEL_46:

  v45 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"requestInfo"]);
  uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0) {
    id v47 = v45;
  }
  else {
    id v47 = 0LL;
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"status"]);
  uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0) {
    id v50 = v48;
  }
  else {
    id v50 = 0LL;
  }
  id v63 = v36;

  if (v50) {
    uint64_t v51 = (uint64_t)[v50 integerValue];
  }
  else {
    uint64_t v51 = -2LL;
  }
  v52 = v68;
  id v53 = v33;
  id v54 = v39;
  v70 = v4;
  v66 = v33;
  if (v73 && v72 && v68 && v15 && v67)
  {
    v56 = v47;
    v55 = v63;
    v57 = v64;
    LOBYTE(v61) = v62;
    v58 = v65;
    v59 = v54;
    v71 =  -[Request initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offerName:previewURL:productType:productTypeName:productURL:requestInfo:status:]( v71,  "initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:o fferName:previewURL:productType:productTypeName:productURL:requestInfo:status:",  v73,  v72,  v68,  v65,  v15,  v67,  v61,  v64,  v53,  v63,  v54,  v44,  v47,  v51);
    v69 = v71;
  }

  else
  {
    v57 = v64;
    v58 = v65;
    v56 = v47;
    v55 = v63;
    v59 = v54;
    v69 = 0LL;
  }

  return v69;
}

- (id)compile
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Request date](self, "date"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v4, @"date");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Request requestIdentifier](self, "requestIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v5, @"identifier");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[Request uniqueIdentifier](self, "uniqueIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v6, @"uniqueIdentifier");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[Request itemBundleIdentifier](self, "itemBundleIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v7,  @"itemBundleIdentifier");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[Request itemIdentifier](self, "itemIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v8, @"itemIdentifier");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Request localizations](self, "localizations"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 compile]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v10, @"localizations");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[Request isMocked](self, "isMocked")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v11, @"mocked");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[Request offerName](self, "offerName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v12, @"offerName");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[Request previewURL](self, "previewURL"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v14, @"previewURL");

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[Request productType](self, "productType"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v15, @"productType");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[Request productTypeName](self, "productTypeName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v16, @"productTypeName");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[Request productURL](self, "productURL"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 absoluteString]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v18, @"productURL");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[Request requestInfo](self, "requestInfo"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v19, @"requestInfo");

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[Request status](self, "status")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v20, @"status");

  return v3;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Request compile](self, "compile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Request ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)itemBundleIdentifier
{
  return self->_itemBundleIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
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

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end