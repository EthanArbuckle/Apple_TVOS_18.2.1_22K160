@interface GenericRequest
- (GenericRequest)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemIdentifier:(id)a6 localizations:(id)a7 offerName:(id)a8 status:(int64_t)a9;
- (GenericRequest)initWithDictionary:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSString)itemIdentifier;
- (NSString)offerName;
- (NSString)requestIdentifier;
- (NSString)uniqueIdentifier;
- (RequestLocalizations)localizations;
- (id)compile;
- (int64_t)status;
@end

@implementation GenericRequest

- (GenericRequest)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemIdentifier:(id)a6 localizations:(id)a7 offerName:(id)a8 status:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GenericRequest;
  v19 = -[GenericRequest init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_date, a3);
    objc_storeStrong((id *)&v20->_requestIdentifier, a4);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v20->_itemIdentifier, a6);
    objc_storeStrong((id *)&v20->_localizations, a7);
    objc_storeStrong((id *)&v20->_offerName, a8);
    v20->_status = a9;
  }

  return v20;
}

- (GenericRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"createdTimeInterval"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
LABEL_5:
    v9 = v7;
    goto LABEL_7;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    [v5 doubleValue];
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_5;
  }

  v9 = 0LL;
LABEL_7:

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"identifier"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    id v12 = v10;
  }
  else {
    id v12 = 0LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uniqueIdentifier"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
    id v15 = v13;
  }
  else {
    id v15 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"itemIdentifier"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
    id v18 = v16;
  }
  else {
    id v18 = 0LL;
  }

  v19 = objc_alloc(&OBJC_CLASS___RequestLocalizations);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"localizations"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
    id v22 = v20;
  }
  else {
    id v22 = 0LL;
  }

  id v23 = -[RequestLocalizations initWithDictionary:](v19, "initWithDictionary:", v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"offerName"]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
    id v26 = v24;
  }
  else {
    id v26 = 0LL;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"status"]);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
    id v29 = v27;
  }
  else {
    id v29 = 0LL;
  }

  if (v29) {
    uint64_t v30 = (uint64_t)[v29 integerValue];
  }
  else {
    uint64_t v30 = -2LL;
  }
  v31 = 0LL;
  if (v9 && v12 && v18 && v23)
  {
    self =  -[GenericRequest initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:]( self,  "initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:",  v9,  v12,  v15,  v18,  v23,  v26,  v30);
    v31 = self;
  }

  return v31;
}

- (id)compile
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest date](self, "date"));
  -[NSMutableDictionary ap_setNullableObject:forKey:]( v3,  "ap_setNullableObject:forKey:",  v4,  @"createdTimeInterval");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v5, @"identifier");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest uniqueIdentifier](self, "uniqueIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v6, @"uniqueIdentifier");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest itemIdentifier](self, "itemIdentifier"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v7, @"itemIdentifier");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest localizations](self, "localizations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 compile]);
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v9, @"localizations");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest offerName](self, "offerName"));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v10, @"offerName");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GenericRequest status](self, "status")));
  -[NSMutableDictionary ap_setNullableObject:forKey:](v3, "ap_setNullableObject:forKey:", v11, @"status");

  return v3;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GenericRequest compile](self, "compile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[GenericRequest ap_generateDescriptionWithSubObjects:]( self,  "ap_generateDescriptionWithSubObjects:",  v3));

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

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end