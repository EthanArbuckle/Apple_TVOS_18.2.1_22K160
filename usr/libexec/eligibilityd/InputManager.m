@interface InputManager
+ (id)sharedInstance;
- (BOOL)_saveInputsWithError:(id *)a3;
- (BOOL)setInput:(id)a3 withError:(id *)a4;
- (InputManager)init;
- (NSDictionary)debugDictionary;
- (NSDictionary)eligibilityInputs;
- (id)_createDefaultInputs;
- (id)_loadInputsWithError:(id *)a3;
- (id)objectForInputValue:(unint64_t)a3;
- (void)setEligibilityInputs:(id)a3;
@end

@implementation InputManager

- (InputManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___InputManager;
  v2 = -[InputManager init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager _createDefaultInputs](v2, "_createDefaultInputs"));
    id v5 = [v4 mutableCopy];

    id v13 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager _loadInputsWithError:](v3, "_loadInputsWithError:", &v13));
    id v7 = v13;
    if (v6)
    {
      [v5 addEntriesFromDictionary:v6];
    }

    else
    {
      id v8 = sub_10000C968();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[InputManager init]";
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Unable to load inputs from disk, initing with empty values: %@",  buf,  0x16u);
      }
    }

    v10 = (NSDictionary *)[v5 copy];
    eligibilityInputs = v3->_eligibilityInputs;
    v3->_eligibilityInputs = v10;
  }

  return v3;
}

- (id)_createDefaultInputs
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v3 = -[LocatedCountryInput initWithCountryCodes:status:process:]( objc_alloc(&OBJC_CLASS___LocatedCountryInput),  "initWithCountryCodes:status:process:",  0LL,  1LL,  0LL);
  if (v3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v3,  @"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION");
  }

  v4 = -[CountryBillingInput initWithBillingCountry:status:process:]( objc_alloc(&OBJC_CLASS___CountryBillingInput),  "initWithBillingCountry:status:process:",  0LL,  1LL,  0LL);
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v4,  @"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING");
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___DeviceClassInput);
  if (v5) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v5,  @"OS_ELIGIBILITY_INPUT_DEVICE_CLASS");
  }

  v6 = -[DeviceLocaleInput initWithDeviceLocale:status:process:]( objc_alloc(&OBJC_CLASS___DeviceLocaleInput),  "initWithDeviceLocale:status:process:",  0LL,  1LL,  0LL);
  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v6,  @"OS_ELIGIBILITY_INPUT_DEVICE_LOCALE");
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___ChinaCellularInput);
  if (v7) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v7,  @"OS_ELIGIBILITY_INPUT_CHINA_CELLULAR");
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___DeviceRegionCodeInput);
  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v8,  @"OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE");
  }

  v9 = objc_alloc_init(&OBJC_CLASS___DeviceLanguageInput);
  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v9,  @"OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE");
  }

  v10 = objc_alloc_init(&OBJC_CLASS___GenerativeModelSystemInput);
  if (v10) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v10,  @"OS_ELIGIBILITY_INPUT_GENERATIVE_MODEL_SYSTEM");
  }

  id v11 = -[GreymatterQueueInput initOnQueue:status:process:]( objc_alloc(&OBJC_CLASS___GreymatterQueueInput),  "initOnQueue:status:process:",  0LL,  1LL,  0LL);
  if (v11) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v11,  @"OS_ELIGIBILITY_INPUT_GREYMATTER_ON_QUEUE");
  }

  v12 = objc_alloc_init(&OBJC_CLASS___SiriLanguageInput);
  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v12,  @"OS_ELIGIBILITY_INPUT_SIRI_LANGUAGE");
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___ExternalBootDriveInput);
  if (v13) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v13,  @"OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE");
  }

  objc_super v14 = objc_alloc_init(&OBJC_CLASS___SharediPadInput);
  if (v14) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v14,  @"OS_ELIGIBILITY_INPUT_SHARED_IPAD");
  }

  v15 = -[EligibilityInput initWithInputType:status:process:]( objc_alloc(&OBJC_CLASS___EligibilityInput),  "initWithInputType:status:process:",  13LL,  0LL,  @"eligibilityd");
  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v15,  @"OS_ELIGIBILITY_INPUT_DEVICE_AND_SIRI_LANGUAGE_MATCH");
  }

  v16 = -[InitialSetupLocationInput initWithLocations:status:process:]( objc_alloc(&OBJC_CLASS___InitialSetupLocationInput),  "initWithLocations:status:process:",  0LL,  1LL,  0LL);
  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v16,  @"OS_ELIGIBILITY_INPUT_INITIAL_SETUP_LOCATION");
  }

  __int16 v17 = -[BirthdateInput initWithDate:status:process:]( objc_alloc(&OBJC_CLASS___BirthdateInput),  "initWithDate:status:process:",  0LL,  1LL,  0LL);
  if (v17) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v17,  @"OS_ELIGIBILITY_INPUT_BIRTHDATE");
  }

  id v18 = -[NSMutableDictionary copy](v2, "copy");
  return v18;
}

- (id)objectForInputValue:(unint64_t)a3
{
  id v5 = sub_10000C740(a3);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  }

  else
  {
    id v9 = sub_10000C968();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[InputManager objectForInputValue:]";
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s: Unknown input %llu",  (uint8_t *)&v12,  0x16u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)setInput:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_10000C740((unint64_t)[v6 type]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
    id v10 = [v9 mutableCopy];

    [v10 setObject:v6 forKeyedSubscript:v8];
    id v11 = (NSDictionary *)[v10 copy];
    eligibilityInputs = self->_eligibilityInputs;
    self->_eligibilityInputs = v11;

    BOOL v13 = -[InputManager _saveInputsWithError:](self, "_saveInputsWithError:", a4);
  }

  else
  {
    id v14 = sub_10000C968();
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      id v18 = "-[InputManager setInput:withError:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Unknown input %@",  (uint8_t *)&v17,  0x16u);
    }

    BOOL v13 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    }
  }

  return v13;
}

- (id)_loadInputsWithError:(id *)a3
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___EligibilityInput);
  id v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v35 = 0LL;
  if (asprintf(&v35, "%s%s", "/", "/private/var/db/eligibilityd/eligibility_inputs.plist") == -1)
  {
    id v8 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "copy_eligibility_domain_input_manager_plist_path";
      __int16 v38 = 2080;
      v39 = "/private/var/db/eligibilityd/eligibility_inputs.plist";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  id v9 = v35;
  if (!v35)
  {
    id v19 = sub_10000C968();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[InputManager _loadInputsWithError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to copy input manager plist path",  buf,  0xCu);
    }

    id v10 = 0LL;
    int v12 = 0LL;
    id v11 = 0LL;
    id v14 = 0LL;
    BOOL v13 = 0LL;
    goto LABEL_22;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v35));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v10, 0LL));
  id v34 = 0LL;
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v11,  3LL,  &v34));
  BOOL v13 = (char *)v34;
  if (!v12)
  {
    id v21 = sub_10000C968();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v29 = (char *)objc_claimAutoreleasedReturnValue([v11 path]);
      *(_DWORD *)buf = 136315650;
      v37 = "-[InputManager _loadInputsWithError:]";
      __int16 v38 = 2112;
      v39 = v29;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: Failed to deserialize data in %@: %@",  buf,  0x20u);
    }

    int v12 = 0LL;
    id v14 = 0LL;
    goto LABEL_22;
  }

  v33 = v13;
  id v14 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v12,  &v33);
  unint64_t v15 = v33;

  if (!v14)
  {
    id v23 = sub_10000C968();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[InputManager _loadInputsWithError:]";
      __int16 v38 = 2112;
      v39 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to create unarchiver: %@",  buf,  0x16u);
    }

    id v14 = 0LL;
    id v18 = 0LL;
    goto LABEL_18;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v14,  "decodeObjectOfClasses:forKey:",  v7,  NSKeyedArchiveRootObjectKey));
  if (!v16)
  {
    id v25 = sub_10000C968();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v32 = (char *)objc_claimAutoreleasedReturnValue([v11 path]);
      uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v14, "error"));
      *(_DWORD *)buf = 136315650;
      v37 = "-[InputManager _loadInputsWithError:]";
      __int16 v38 = 2112;
      v39 = v32;
      __int16 v40 = 2112;
      uint64_t v41 = v30;
      v31 = (void *)v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to decode input from data at %@ : %@",  buf,  0x20u);
    }

    BOOL v13 = (char *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v14, "error"));
LABEL_22:
    id v18 = 0LL;
    goto LABEL_23;
  }

  int v17 = (void *)v16;
  -[NSKeyedUnarchiver finishDecoding](v14, "finishDecoding");
  id v18 = v17;
LABEL_18:
  BOOL v13 = v15;
LABEL_23:
  free(v9);
  if (a3 && !v18) {
    *a3 = v13;
  }
  id v27 = v18;

  return v27;
}

- (BOOL)_saveInputsWithError:(id *)a3
{
  id v23 = 0LL;
  if (asprintf(&v23, "%s%s", "/", "/private/var/db/eligibilityd/eligibility_inputs.plist") == -1)
  {
    uint64_t v5 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "copy_eligibility_domain_input_manager_plist_path";
      __int16 v26 = 2080;
      id v27 = "/private/var/db/eligibilityd/eligibility_inputs.plist";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  id v6 = v23;
  if (v23)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v23));
    id v8 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
    -[NSKeyedArchiver encodeObject:forKey:](v8, "encodeObject:forKey:", v9, NSKeyedArchiveRootObjectKey);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v8, "encodedData"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 0LL));
    id v22 = 0LL;
    unsigned int v12 = [v10 writeToURL:v11 options:268435457 error:&v22];
    id v13 = v22;
    if (v12)
    {
      free(v6);
      BOOL v14 = 1;
      goto LABEL_16;
    }

    id v17 = sub_10000C968();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = (char *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      *(_DWORD *)buf = 136315906;
      id v25 = "-[InputManager _saveInputsWithError:]";
      __int16 v26 = 2112;
      id v27 = v20;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s: Failed to write eligibility data %@ to disk at %@: %@",  buf,  0x2Au);
    }
  }

  else
  {
    id v15 = sub_10000C968();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[InputManager _saveInputsWithError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to copy input manager plist path",  buf,  0xCu);
    }

    id v7 = 0LL;
    id v11 = 0LL;
    id v10 = 0LL;
    id v13 = 0LL;
  }

  free(v6);
  if (a3)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a3 = v13;
  }

  else
  {
    BOOL v14 = 0;
  }

- (NSDictionary)debugDictionary
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000A8AC;
  v8[3] = &unk_1000349B0;
  id v9 = v3;
  uint64_t v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = -[NSMutableDictionary copy](v5, "copy");
  return (NSDictionary *)v6;
}

- (NSDictionary)eligibilityInputs
{
  return self->_eligibilityInputs;
}

- (void)setEligibilityInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A980;
  block[3] = &unk_100034E00;
  block[4] = a1;
  if (qword_100044738 != -1) {
    dispatch_once(&qword_100044738, block);
  }
  return (id)qword_100044730;
}

@end