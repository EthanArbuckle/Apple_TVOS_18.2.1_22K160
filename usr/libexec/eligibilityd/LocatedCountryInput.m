@interface LocatedCountryInput
+ (BOOL)supportsSecureCoding;
+ (unint64_t)_parseConfidenceFromInputDict:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LocatedCountryInput)initWithCoder:(id)a3;
- (LocatedCountryInput)initWithCountryCodes:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSSet)countryCodes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_deviceMinimiumRequiredConfidence;
- (unint64_t)confidence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setCountryCodes:(id)a3;
@end

@implementation LocatedCountryInput

- (LocatedCountryInput)initWithCountryCodes:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      v13 = (os_log_s *)v8;
      uint64_t v17 = 4LL;
    }

    else
    {
      v11 = type;
      if (type != (xpc_type_t)&_xpc_type_dictionary)
      {
        id v12 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_25:
          v23 = 0LL;
          goto LABEL_26;
        }

        *(_DWORD *)buf = 136315394;
        v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        __int16 v36 = 2080;
        name = xpc_type_get_name(v11);
        v14 = "%s: Located country codes input is wrong data type: %s";
        v15 = v13;
        uint32_t v16 = 22;
LABEL_6:
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
        goto LABEL_25;
      }

      xpc_object_t array = xpc_dictionary_get_array(v8, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_COUNTRY_CODE_LIST");
      uint64_t v25 = objc_claimAutoreleasedReturnValue(array);
      if (!v25)
      {
        id v29 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136315138;
        v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        v14 = "%s: Located country codes input missing country code array";
        v15 = v13;
        uint32_t v16 = 12;
        goto LABEL_6;
      }

      v13 = (os_log_s *)v25;
      unint64_t v26 = +[LocatedCountryInput _parseConfidenceFromInputDict:]( &OBJC_CLASS___LocatedCountryInput,  "_parseConfidenceFromInputDict:",  v8);
      if (!v26)
      {
        id v30 = sub_10000C968();
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s: Located country codes input missing confidence values",  buf,  0xCu);
        }

        goto LABEL_25;
      }

      uint64_t v17 = v26;
    }

    v18 = (void *)_CFXPCCreateCFObjectFromXPCObject(v13);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((sub_100017A60(v18, v19) & 1) == 0)
    {
      id v27 = sub_10000C968();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[LocatedCountryInput initWithCountryCodes:status:process:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s: Located country codes input contains non-String entries",  buf,  0xCu);
      }

      goto LABEL_25;
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));

    v13 = (os_log_s *)v20;
  }

  else
  {
    uint64_t v17 = 0LL;
    v13 = 0LL;
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  v21 = -[EligibilityInput initWithInputType:status:process:](&v33, "initWithInputType:status:process:", 1LL, a4, v9);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_countryCodes, v13);
    v22->_confidence = v17;
  }

  self = v22;
  v23 = self;
LABEL_26:

  return v23;
}

- (unint64_t)_deviceMinimiumRequiredConfidence
{
  else {
    return 1LL;
  }
}

- (NSSet)countryCodes
{
  unint64_t v3 = -[LocatedCountryInput confidence](self, "confidence");
  if (v3 >= -[LocatedCountryInput _deviceMinimiumRequiredConfidence](self, "_deviceMinimiumRequiredConfidence")) {
    v4 = self->_countryCodes;
  }
  else {
    v4 = 0LL;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  id v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"countryCodes"];
}

- (LocatedCountryInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  v5 = -[EligibilityInput initWithCoder:](&v14, "initWithCoder:", v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
    v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"countryCodes"]);
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"confidence"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v5->_confidence = (unint64_t)[v12 unsignedIntegerValue];

    if (!v5->_confidence)
    {
      if (v5->_countryCodes) {
        v5->_confidence = 4LL;
      }
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  objc_msgSend(v5, "setConfidence:", -[LocatedCountryInput confidence](self, "confidence"));
  return v5;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  unint64_t v3 = -[EligibilityInput hash](&v8, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ -[LocatedCountryInput confidence](self, "confidence") ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LocatedCountryInput *)a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  if (-[EligibilityInput isEqual:](&v16, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v11 = 1;
      goto LABEL_16;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](v6, "countryCodes"));
      char v9 = sub_1000179E0(v7, v8);

      if ((v9 & 1) != 0)
      {
        id v10 = -[LocatedCountryInput confidence](self, "confidence");
        if (v10 == (id)-[LocatedCountryInput confidence](v6, "confidence"))
        {
          BOOL v11 = 1;
LABEL_15:

          goto LABEL_16;
        }

        id v14 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[LocatedCountryInput isEqual:]";
          __int16 v19 = 2080;
          uint64_t v20 = "confidence";
          goto LABEL_13;
        }
      }

      else
      {
        id v12 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[LocatedCountryInput isEqual:]";
          __int16 v19 = 2080;
          uint64_t v20 = "countryCodes";
LABEL_13:
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Property %s did not match",  buf,  0x16u);
        }
      }

      BOOL v11 = 0;
      goto LABEL_15;
    }
  }

  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (id)description
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocatedCountryInput countryCodes](self, "countryCodes"));
  unint64_t v4 = -[LocatedCountryInput confidence](self, "confidence");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LocatedCountryInput;
  id v5 = -[EligibilityInput description](&v9, "description");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[LocatedCountryInput countryCodes:%@ confidence:%lu %@]",  v3,  v4,  v6));

  return v7;
}

- (void)setCountryCodes:(id)a3
{
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
}

+ (unint64_t)_parseConfidenceFromInputDict:(id)a3
{
  id v3 = a3;
  if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_SINGLE_LOCATION"))
  {
    unint64_t v4 = 4LL;
  }

  else if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_NEARBY_CELLS_MCC"))
  {
    unint64_t v4 = 3LL;
  }

  else if (xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_SERVING_CELL_MCC"))
  {
    unint64_t v4 = 2LL;
  }

  else
  {
    unint64_t v4 = xpc_dictionary_get_BOOL(v3, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION_KEY_HAS_WIFIAP");
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end