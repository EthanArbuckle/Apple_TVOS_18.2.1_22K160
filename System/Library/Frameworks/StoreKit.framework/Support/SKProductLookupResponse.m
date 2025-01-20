@interface SKProductLookupResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEntitled;
- (NSDictionary)parameters;
- (NSDictionary)resultDictionary;
- (NSString)extensionBundleID;
- (NSURL)deepLinkURL;
- (NSURL)productURL;
- (SKProductLookupResponse)initWithCoder:(id)a3;
- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKProductLookupResponse

- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SKProductLookupResponse;
  v18 = -[SKProductLookupResponse init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resultDictionary, a3);
    objc_storeStrong((id *)&v19->_extensionBundleID, a4);
    objc_storeStrong((id *)&v19->_productURL, a5);
    v19->_isEntitled = a6;
    objc_storeStrong((id *)&v19->_parameters, a7);
    objc_storeStrong((id *)&v19->_deepLinkURL, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  resultDictionary = self->_resultDictionary;
  id v12 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  resultDictionary,  1LL,  &v12));
  id v7 = v12;
  [v4 encodeObject:v6 forKey:@"resultDictionary"];
  if (v7)
  {
    if (qword_10032DEC0 != -1) {
      dispatch_once(&qword_10032DEC0, &stru_1002E6E70);
    }
    if (os_log_type_enabled((os_log_t)qword_10032DEB8, OS_LOG_TYPE_ERROR)) {
      sub_10025B848();
    }
  }

  parameters = self->_parameters;
  id v11 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  parameters,  1LL,  &v11));
  id v10 = v11;
  if (v10)
  {
    if (qword_10032DEC0 != -1) {
      dispatch_once(&qword_10032DEC0, &stru_1002E6E70);
    }
    if (os_log_type_enabled((os_log_t)qword_10032DEB8, OS_LOG_TYPE_ERROR)) {
      sub_10025B7E8();
    }
  }

  [v4 encodeObject:v9 forKey:@"parameters"];
  [v4 encodeObject:self->_extensionBundleID forKey:@"extensionBundleID"];
  [v4 encodeObject:self->_productURL forKey:@"productURL"];
  [v4 encodeObject:self->_deepLinkURL forKey:@"deepLinkURL"];
  [v4 encodeBool:self->_isEntitled forKey:@"isEntitled"];
}

- (SKProductLookupResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SKProductLookupResponse;
  v5 = -[SKProductLookupResponse init](&v38, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"resultDictionary"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
    id v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v9,  v10,  v11,  v12,  v13,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v37 = 0LL;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v15,  v7,  &v37));
    id v17 = v37;
    if (v17)
    {
      if (qword_10032DEC0 != -1) {
        dispatch_once(&qword_10032DEC0, &stru_1002E6E70);
      }
      if (os_log_type_enabled((os_log_t)qword_10032DEB8, OS_LOG_TYPE_ERROR)) {
        sub_10025B908();
      }
    }

    v18 = (NSDictionary *)[v16 copy];
    resultDictionary = v5->_resultDictionary;
    v5->_resultDictionary = v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"extensionBundleID"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    extensionBundleID = v5->_extensionBundleID;
    v5->_extensionBundleID = (NSString *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"productURL"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v24;

    id v26 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"deepLinkURL"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    deepLinkURL = v5->_deepLinkURL;
    v5->_deepLinkURL = (NSURL *)v27;

    v5->_isEntitled = [v4 decodeBoolForKey:@"isEntitled"];
    id v29 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"parameters"];
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v36 = 0LL;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v15,  v30,  &v36));
    id v32 = v36;
    if (v32)
    {
      if (qword_10032DEC0 != -1) {
        dispatch_once(&qword_10032DEC0, &stru_1002E6E70);
      }
      if (os_log_type_enabled((os_log_t)qword_10032DEB8, OS_LOG_TYPE_ERROR)) {
        sub_10025B8A8();
      }
    }

    v33 = (NSDictionary *)[v31 copy];
    parameters = v5->_parameters;
    v5->_parameters = v33;
  }

  return v5;
}

- (NSDictionary)resultDictionary
{
  return self->_resultDictionary;
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void).cxx_destruct
{
}

@end