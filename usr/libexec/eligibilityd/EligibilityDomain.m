@interface EligibilityDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)computeAnswerFromStatusWithError:(id *)a3;
- (BOOL)hasActiveGracePeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInterestedInInput:(unint64_t)a3;
- (BOOL)shouldSaveToDisk;
- (EligibilityDomain)init;
- (EligibilityDomain)initWithCoder:(id)a3;
- (EligibilityTimer)locatedCountryTimer;
- (NSDictionary)context;
- (NSDictionary)status;
- (NSNumber)ageOfInterest;
- (NSSet)billingCountriesOfInterest;
- (NSSet)deviceClassesOfInterest;
- (NSSet)deviceLanguagesOfInterest;
- (NSSet)deviceLocalesOfInterest;
- (NSSet)deviceRegionCodesOfInterest;
- (NSSet)initialLocationsOfInterest;
- (NSSet)locatedCountriesOfInterest;
- (NSString)domainChangeNotificationName;
- (id)_interestedDataString;
- (id)_supportedInputsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serialize;
- (unint64_t)_computeInputStatusForSet:(id)a3 withObject:(id)a4 isInverted:(BOOL)a5;
- (unint64_t)answer;
- (unint64_t)answerSource;
- (unint64_t)computeAnswerFromStatus:(id)a3;
- (unint64_t)computeInputStatusForBillingCountryInput:(id)a3;
- (unint64_t)computeInputStatusForBirthdateInput:(id)a3;
- (unint64_t)computeInputStatusForChinaCellularInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceAndSiriLanguageMatch;
- (unint64_t)computeInputStatusForDeviceClassInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceLocaleInput:(id)a3;
- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3;
- (unint64_t)computeInputStatusForExternalBootDriveInput:(id)a3;
- (unint64_t)computeInputStatusForGenerativeModelSystemInput:(id)a3;
- (unint64_t)computeInputStatusForGreymatterQueueInput:(id)a3;
- (unint64_t)computeInputStatusForInitialSetupLocationInput:(id)a3;
- (unint64_t)computeInputStatusForInput:(id)a3;
- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3;
- (unint64_t)computeInputStatusForSharediPadInput:(id)a3;
- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
- (unint64_t)hash;
- (unint64_t)inversionMask;
- (unint64_t)supportedInputs;
- (void)addContextForKey:(id)a3 value:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)resetInputsOfInterest;
- (void)setAgeLimitOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setAgeOfInterest:(id)a3;
- (void)setAnswer:(unint64_t)a3;
- (void)setBillingCountriesOfInterest:(id)a3;
- (void)setBillingCountriesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setBillingCountryInterest;
- (void)setChinaCellularInterest;
- (void)setContext:(id)a3;
- (void)setDeviceAndSiriLangaugeMatchInterest;
- (void)setDeviceClassesOfInterest:(id)a3;
- (void)setDeviceClassesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setDeviceLanguageInterest;
- (void)setDeviceLanguagesOfInterest:(id)a3;
- (void)setDeviceLocalesOfInterest:(id)a3;
- (void)setDeviceLocalesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setDeviceRegionCodesOfInterest:(id)a3;
- (void)setDeviceRegionCodesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setDeviceRegionInterest;
- (void)setExternalBootInterest;
- (void)setGenerativeModelSystemVersionInterest;
- (void)setGreymatterQueueInterest;
- (void)setInitialLocationsOfInterest:(id)a3;
- (void)setInitialSetupLocationsOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setInversionMask:(unint64_t)a3;
- (void)setLocatedCountriesOfInterest:(id)a3;
- (void)setLocatedCountriesOfInterest:(id)a3 isInverted:(BOOL)a4;
- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4;
- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4 isInverted:(BOOL)a5;
- (void)setLocatedCountryInterest;
- (void)setLocatedCountryTimer:(id)a3;
- (void)setSharediPadInterest;
- (void)setSiriLanguageInterest;
- (void)setSupportedInputs:(unint64_t)a3;
- (void)updateParameters;
@end

@implementation EligibilityDomain

- (unint64_t)domain
{
  unint64_t result = _os_crash("This property must be overridden", a2);
  __break(1u);
  return result;
}

- (NSString)domainChangeNotificationName
{
  unint64_t result = (NSString *)_os_crash("This property must be overridden", a2);
  __break(1u);
  return result;
}

- (void)updateParameters
{
}

- (unint64_t)defaultAnswer
{
  return 2LL;
}

- (EligibilityDomain)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___EligibilityDomain;
  v2 = -[EligibilityDomain init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    context = v2->_context;
    v2->_answer = 0LL;
    v2->_context = 0LL;

    v3->_supportedInputs = 0LL;
  }

  return v3;
}

- (void)setLocatedCountriesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFFELL | (v6 != 0LL));
  locatedCountriesOfInterest = self->_locatedCountriesOfInterest;
  self->_locatedCountriesOfInterest = v6;

  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFFELL | v4;
}

- (void)setLocatedCountriesOfInterest:(id)a3
{
}

- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4 isInverted:(BOOL)a5
{
  v7 = (EligibilityTimer *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  if (v7)
  {
    v8 = v7;
    -[EligibilityTimer setDurationWithSeconds:](v7, "setDurationWithSeconds:", a4);
  }

  else
  {
    v8 = -[EligibilityTimer initWithSeconds:](objc_alloc(&OBJC_CLASS___EligibilityTimer), "initWithSeconds:", a4);
  }

  -[EligibilityDomain setLocatedCountryTimer:](self, "setLocatedCountryTimer:", v8);
}

- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4
{
}

- (void)setBillingCountriesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFFDLL | (2LL * (v6 != 0LL)));
  billingCountriesOfInterest = self->_billingCountriesOfInterest;
  self->_billingCountriesOfInterest = v6;

  uint64_t v8 = 2LL;
  if (!v4) {
    uint64_t v8 = 0LL;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFFDLL | v8;
}

- (void)setBillingCountriesOfInterest:(id)a3
{
}

- (void)setDeviceClassesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFFBLL | (4LL * (v6 != 0LL)));
  deviceClassesOfInterest = self->_deviceClassesOfInterest;
  self->_deviceClassesOfInterest = v6;

  uint64_t v8 = 4LL;
  if (!v4) {
    uint64_t v8 = 0LL;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFFBLL | v8;
}

- (void)setDeviceClassesOfInterest:(id)a3
{
}

- (void)setDeviceLocalesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFF7LL | (8LL * (v6 != 0LL)));
  deviceLocalesOfInterest = self->_deviceLocalesOfInterest;
  self->_deviceLocalesOfInterest = v6;

  uint64_t v8 = 8LL;
  if (!v4) {
    uint64_t v8 = 0LL;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFF7LL | v8;
}

- (void)setDeviceLocalesOfInterest:(id)a3
{
}

- (void)setLocatedCountryInterest
{
}

- (void)setBillingCountryInterest
{
}

- (void)setChinaCellularInterest
{
}

- (void)setDeviceRegionInterest
{
}

- (void)setDeviceRegionCodesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFDFLL | (32LL * (v6 != 0LL)));
  deviceRegionCodesOfInterest = self->_deviceRegionCodesOfInterest;
  self->_deviceRegionCodesOfInterest = v6;

  uint64_t v8 = 32LL;
  if (!v4) {
    uint64_t v8 = 0LL;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFFFDFLL | v8;
}

- (void)setDeviceRegionCodesOfInterest:(id)a3
{
}

- (void)setDeviceLanguageInterest
{
}

- (void)setDeviceLanguagesOfInterest:(id)a3
{
  BOOL v4 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(v4 != 0LL) << 6));
  deviceLanguagesOfInterest = self->_deviceLanguagesOfInterest;
  self->_deviceLanguagesOfInterest = v4;
}

- (void)setGenerativeModelSystemVersionInterest
{
}

- (void)setGreymatterQueueInterest
{
}

- (void)setSiriLanguageInterest
{
}

- (void)setExternalBootInterest
{
}

- (void)setSharediPadInterest
{
}

- (void)setDeviceAndSiriLangaugeMatchInterest
{
}

- (void)setInitialSetupLocationsOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)(v6 != 0LL) << 13));
  initialLocationsOfInterest = self->_initialLocationsOfInterest;
  self->_initialLocationsOfInterest = v6;

  uint64_t v8 = 0x2000LL;
  if (!v4) {
    uint64_t v8 = 0LL;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFDFFFLL | v8;
}

- (void)setAgeLimitOfInterest:(id)a3 isInverted:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (NSNumber *)a3;
  -[EligibilityDomain setSupportedInputs:]( self,  "setSupportedInputs:",  -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(v6 != 0LL) << 14));
  ageOfInterest = self->_ageOfInterest;
  self->_ageOfInterest = v6;

  uint64_t v8 = 0x4000LL;
  if (!v4) {
    uint64_t v8 = 0LL;
  }
  self->_inversionMask = self->_inversionMask & 0xFFFFFFFFFFFFBFFFLL | v8;
}

- (void)resetInputsOfInterest
{
}

- (unint64_t)answerSource
{
  return 1LL;
}

- (NSDictionary)status
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](&OBJC_CLASS___InputManager, "sharedInstance"));
  for (unint64_t i = 1LL; i != 16; ++i)
  {
    if (-[EligibilityDomain isInterestedInInput:](self, "isInterestedInInput:", i))
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForInputValue:i]);
      v7 = v6;
      if (v6)
      {
        unint64_t v8 = (unint64_t)[v6 status];
        if (!v8) {
          unint64_t v8 = -[EligibilityDomain computeInputStatusForInput:](self, "computeInputStatusForInput:", v7);
        }
      }

      else
      {
        unint64_t v8 = 1LL;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v8));
      id v10 = sub_10000C910(i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v11);
    }
  }

  id v12 = -[NSMutableDictionary copy](v3, "copy");

  return (NSDictionary *)v12;
}

- (unint64_t)computeInputStatusForInput:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  if (-[EligibilityDomain isInterestedInInput:](self, "isInterestedInInput:", v5))
  {
    switch((unint64_t)v5)
    {
      case 1uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForLocatedCountryInput:]( self,  "computeInputStatusForLocatedCountryInput:",  v4);
        goto LABEL_22;
      case 2uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForBillingCountryInput:]( self,  "computeInputStatusForBillingCountryInput:",  v4);
        goto LABEL_22;
      case 3uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForDeviceClassInput:]( self,  "computeInputStatusForDeviceClassInput:",  v4);
        goto LABEL_22;
      case 4uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForDeviceLocaleInput:]( self,  "computeInputStatusForDeviceLocaleInput:",  v4);
        goto LABEL_22;
      case 5uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForChinaCellularInput:]( self,  "computeInputStatusForChinaCellularInput:",  v4);
        goto LABEL_22;
      case 6uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForDeviceRegionCodesInput:]( self,  "computeInputStatusForDeviceRegionCodesInput:",  v4);
        goto LABEL_22;
      case 7uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForDeviceLanguageInput:]( self,  "computeInputStatusForDeviceLanguageInput:",  v4);
        goto LABEL_22;
      case 8uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForGenerativeModelSystemInput:]( self,  "computeInputStatusForGenerativeModelSystemInput:",  v4);
        goto LABEL_22;
      case 9uLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForGreymatterQueueInput:]( self,  "computeInputStatusForGreymatterQueueInput:",  v4);
        goto LABEL_22;
      case 0xAuLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForSiriLanguageInput:]( self,  "computeInputStatusForSiriLanguageInput:",  v4);
        goto LABEL_22;
      case 0xBuLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForExternalBootDriveInput:]( self,  "computeInputStatusForExternalBootDriveInput:",  v4);
        goto LABEL_22;
      case 0xCuLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForSharediPadInput:]( self,  "computeInputStatusForSharediPadInput:",  v4);
        goto LABEL_22;
      case 0xDuLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForDeviceAndSiriLanguageMatch]( self,  "computeInputStatusForDeviceAndSiriLanguageMatch");
        goto LABEL_22;
      case 0xEuLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForInitialSetupLocationInput:]( self,  "computeInputStatusForInitialSetupLocationInput:",  v4);
        goto LABEL_22;
      case 0xFuLL:
        unint64_t v6 = -[EligibilityDomain computeInputStatusForBirthdateInput:](self, "computeInputStatusForBirthdateInput:", v4);
LABEL_22:
        unint64_t v7 = v6;
        break;
      default:
        id v8 = sub_10000C968();
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v11 = sub_10000C910((unint64_t)v5);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          int v13 = 136315906;
          v14 = "-[EligibilityDomain computeInputStatusForInput:]";
          __int16 v15 = 2112;
          v16 = self;
          __int16 v17 = 2112;
          v18 = v12;
          __int16 v19 = 2048;
          id v20 = v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Unsupported input for %@: %@(%llu)",  (uint8_t *)&v13,  0x2Au);
        }

        unint64_t v7 = 5LL;
        break;
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)isInterestedInInput:(unint64_t)a3
{
  unint64_t v4 = -[EligibilityDomain supportedInputs](self, "supportedInputs");
  switch(a3)
  {
    case 1uLL:
      LOBYTE(v4) = v4 & 1;
      break;
    case 2uLL:
      unint64_t v4 = (v4 >> 1) & 1;
      break;
    case 3uLL:
      unint64_t v4 = (v4 >> 2) & 1;
      break;
    case 4uLL:
      unint64_t v4 = (v4 >> 3) & 1;
      break;
    case 5uLL:
      unint64_t v4 = (v4 >> 4) & 1;
      break;
    case 6uLL:
      unint64_t v4 = (v4 >> 5) & 1;
      break;
    case 7uLL:
      unint64_t v4 = (v4 >> 6) & 1;
      break;
    case 8uLL:
      unint64_t v4 = (v4 >> 7) & 1;
      break;
    case 9uLL:
      unint64_t v4 = (v4 >> 8) & 1;
      break;
    case 0xAuLL:
      unint64_t v4 = (v4 >> 9) & 1;
      break;
    case 0xBuLL:
      unint64_t v4 = (v4 >> 10) & 1;
      break;
    case 0xCuLL:
      unint64_t v4 = (v4 >> 11) & 1;
      break;
    case 0xDuLL:
      unint64_t v4 = (v4 >> 12) & 1;
      break;
    case 0xEuLL:
      unint64_t v4 = (v4 >> 13) & 1;
      break;
    case 0xFuLL:
      unint64_t v4 = (v4 >> 14) & 1;
      break;
    default:
      LOBYTE(v4) = 0;
      break;
  }

  return v4;
}

- (BOOL)hasActiveGracePeriod
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  id v5 = v4;
  if (v4) {
    unsigned __int8 v3 = [v4 isActive];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (unint64_t)_computeInputStatusForSet:(id)a3 withObject:(id)a4 isInverted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v5) {
    uint64_t v10 = 2LL;
  }
  else {
    uint64_t v10 = 3LL;
  }
  if (v5) {
    unint64_t v11 = 3LL;
  }
  else {
    unint64_t v11 = 2LL;
  }
  if (v7)
  {
    if (v8)
    {
    }

    else
    {
      unint64_t v11 = 1LL;
    }
  }

  return v11;
}

- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  unint64_t v6 = -[EligibilityDomain inversionMask](self, "inversionMask") & 1;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCodes]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCodes]);
      unsigned int v10 = [v9 intersectsSet:v7];

      if ((_DWORD)v6 == v10)
      {
        [v5 resume];
        if (v5)
        {
          else {
            unint64_t v11 = 3LL;
          }
        }

        else
        {
          unint64_t v11 = 2LL;
        }
      }

      else
      {
        [v5 reset];
        [v5 enable];
        unint64_t v11 = 3LL;
      }
    }

    else
    {
      unint64_t v11 = 1LL;
    }
  }

  else
  {
    unint64_t v11 = v6 | 2;
  }

  return v11;
}

- (unint64_t)computeInputStatusForBillingCountryInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCode]);

  unint64_t v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:]( self,  "_computeInputStatusForSet:withObject:isInverted:",  v5,  v6,  (-[EligibilityDomain inversionMask](self, "inversionMask") >> 1) & 1);
  return v7;
}

- (unint64_t)computeInputStatusForDeviceClassInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceClass]);

  unint64_t v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:]( self,  "_computeInputStatusForSet:withObject:isInverted:",  v5,  v6,  (-[EligibilityDomain inversionMask](self, "inversionMask") >> 2) & 1);
  return v7;
}

- (unint64_t)computeInputStatusForDeviceLocaleInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceLocale]);

  unint64_t v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:]( self,  "_computeInputStatusForSet:withObject:isInverted:",  v5,  v6,  (-[EligibilityDomain inversionMask](self, "inversionMask") >> 3) & 1);
  return v7;
}

- (unint64_t)computeInputStatusForChinaCellularInput:(id)a3
{
  else {
    return 2LL;
  }
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceRegionCode]);

  unint64_t v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:]( self,  "_computeInputStatusForSet:withObject:isInverted:",  v5,  v6,  (-[EligibilityDomain inversionMask](self, "inversionMask") >> 5) & 1);
  return v7;
}

- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 primaryLanguage]);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
    unsigned int v6 = [v5 containsObject:v4];

    if (v6) {
      unint64_t v7 = 3LL;
    }
    else {
      unint64_t v7 = 2LL;
    }
  }

  else
  {
    unint64_t v7 = 1LL;
  }

  return v7;
}

- (unint64_t)computeInputStatusForGenerativeModelSystemInput:(id)a3
{
  else {
    return 2LL;
  }
}

- (unint64_t)computeInputStatusForGreymatterQueueInput:(id)a3
{
  else {
    return 3LL;
  }
}

- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3
{
  id v3 = a3;
  unint64_t result = _os_crash("This method must be overridden", v4);
  __break(1u);
  return result;
}

- (unint64_t)computeInputStatusForExternalBootDriveInput:(id)a3
{
  else {
    return 3LL;
  }
}

- (unint64_t)computeInputStatusForSharediPadInput:(id)a3
{
  else {
    return 3LL;
  }
}

- (unint64_t)computeInputStatusForDeviceAndSiriLanguageMatch
{
  unint64_t result = _os_crash("This method must be overridden", a2);
  __break(1u);
  return result;
}

- (unint64_t)computeInputStatusForInitialSetupLocationInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCodes]);

  if (v5)
  {
    unsigned __int16 v6 = (unsigned __int16)-[EligibilityDomain inversionMask](self, "inversionMask");
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain initialLocationsOfInterest](self, "initialLocationsOfInterest"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCodes]);
    unsigned int v9 = ((v6 & 0x2000) == 0) ^ [v7 intersectsSet:v8];

    if (v9) {
      unint64_t v10 = 2LL;
    }
    else {
      unint64_t v10 = 3LL;
    }
  }

  else
  {
    unint64_t v10 = 1LL;
  }

  return v10;
}

- (unint64_t)computeInputStatusForBirthdateInput:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (unsigned __int16)-[EligibilityDomain inversionMask](self, "inversionMask");
  if ((v5 & 0x4000) != 0) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  if ((v5 & 0x4000) != 0) {
    unint64_t v7 = 2LL;
  }
  else {
    unint64_t v7 = 3LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 age]);

  if (v8)
  {
    unint64_t v7 = 1LL;
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain ageOfInterest](self, "ageOfInterest"));
    if (!v9 && [0 compare:0] != (id)-1) {
      unint64_t v7 = v6;
    }
  }

  return v7;
}

- (id)serialize
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[EligibilityDomain answer](self, "answer")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"os_eligibility_answer_t");

  unsigned __int16 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[EligibilityDomain answerSource](self, "answerSource")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"os_eligibility_answer_source_t");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"status");

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"context");

  id v8 = -[NSMutableDictionary copy](v3, "copy");
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[EligibilityDomain answer](self, "answer")));
  [v4 encodeObject:v5 forKey:@"answer"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  [v4 encodeObject:v6 forKey:@"context"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  [v4 encodeObject:v7 forKey:@"locatedCountryTimer"];
}

- (EligibilityDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___EligibilityDomain;
  unsigned __int16 v5 = -[EligibilityDomain init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"answer"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_answer = (unint64_t)[v7 unsignedIntegerValue];

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    unint64_t v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  v9,  v10,  objc_opt_class(&OBJC_CLASS___NSArray),  0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"context"]);
    context = v5->_context;
    v5->_context = (NSDictionary *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(EligibilityTimer) forKey:@"locatedCountryTimer"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    locatedCountryTimer = v5->_locatedCountryTimer;
    v5->_locatedCountryTimer = (EligibilityTimer *)v16;
  }

  return v5;
}

- (BOOL)shouldSaveToDisk
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (unint64_t)computeAnswerFromStatus:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues", 0));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5)
  {

    return -[EligibilityDomain defaultAnswer](self, "defaultAnswer");
  }

  id v6 = v5;
  char v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v14;
  while (2)
  {
    for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) unsignedLongLongValue];
      if (v11 == (id)3)
      {
        char v7 = 1;
      }

      else
      {
        if ((unint64_t)v11 < 2)
        {

          return 1LL;
        }

        char v8 = 1;
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6) {
      continue;
    }
    break;
  }

  if ((v8 & 1) != 0) {
    unint64_t result = 2LL;
  }
  else {
    unint64_t result = 4LL;
  }
  return result;
}

- (BOOL)computeAnswerFromStatusWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  if (v5)
  {
    -[EligibilityDomain setAnswer:]( self,  "setAnswer:",  -[EligibilityDomain computeAnswerFromStatus:](self, "computeAnswerFromStatus:", v5));
    id v6 = 0LL;
  }

  else
  {
    id v7 = sub_10000C968();
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      id v12 = "-[EligibilityDomain computeAnswerFromStatusWithError:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "%s: Failed to get status for a computed domain",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  93LL,  0LL));
    id v6 = v9;
    if (a3)
    {
      id v6 = v9;
      *a3 = v6;
    }
  }

  return v5 != 0LL;
}

- (void)addContextForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
    int v11 = (NSMutableDictionary *)[v9 mutableCopy];
  }

  else
  {
    int v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, v7);

  id v10 = -[NSMutableDictionary copy](v11, "copy");
  -[EligibilityDomain setContext:](self, "setContext:", v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAnswer:", -[EligibilityDomain answer](self, "answer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setContext:v7];

  objc_msgSend(v5, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setLocatedCountriesOfInterest:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  id v11 = [v10 copyWithZone:a3];
  [v5 setBillingCountriesOfInterest:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
  id v13 = [v12 copyWithZone:a3];
  [v5 setDeviceClassesOfInterest:v13];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  id v15 = [v14 copyWithZone:a3];
  [v5 setDeviceLocalesOfInterest:v15];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  id v17 = [v16 copyWithZone:a3];
  [v5 setDeviceRegionCodesOfInterest:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
  id v19 = [v18 copyWithZone:a3];
  [v5 setDeviceLanguagesOfInterest:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain initialLocationsOfInterest](self, "initialLocationsOfInterest"));
  id v21 = [v20 copyWithZone:a3];
  [v5 setInitialLocationsOfInterest:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain ageOfInterest](self, "ageOfInterest"));
  [v5 setAgeOfInterest:v22];

  objc_msgSend(v5, "setInversionMask:", -[EligibilityDomain inversionMask](self, "inversionMask"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  id v24 = [v23 copyWithZone:a3];
  [v5 setLocatedCountryTimer:v24];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = -[EligibilityDomain answer](self, "answer");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  unint64_t v7 = (unint64_t)[v6 hash];

  unint64_t v8 = v5 ^ v7 ^ -[EligibilityDomain supportedInputs](self, "supportedInputs");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  unint64_t v10 = (unint64_t)[v9 hash];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  unint64_t v12 = v10 ^ (unint64_t)[v11 hash];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
  unint64_t v14 = v8 ^ v12 ^ (unint64_t)[v13 hash];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  unint64_t v16 = (unint64_t)[v15 hash];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
  unint64_t v18 = v16 ^ (unint64_t)[v17 hash];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  unint64_t v20 = v18 ^ (unint64_t)[v19 hash];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  unint64_t v22 = v14 ^ v20 ^ (unint64_t)[v21 hash];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain initialLocationsOfInterest](self, "initialLocationsOfInterest"));
  unint64_t v24 = (unint64_t)[v23 hash];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain ageOfInterest](self, "ageOfInterest"));
  unint64_t v26 = v24 ^ (unint64_t)[v25 hash];

  return v22 ^ v26 ^ -[EligibilityDomain inversionMask](self, "inversionMask");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EligibilityDomain *)a3;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___EligibilityDomain;
  if (-[EligibilityDomain isEqual:](&v60, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v43 = 1;
      goto LABEL_52;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = -[EligibilityDomain answer](self, "answer");
      if (v7 == (id)-[EligibilityDomain answer](v6, "answer"))
      {
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](v6, "status"));
        char v10 = sub_1000179E0(v8, v9);

        if ((v10 & 1) != 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
          unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](v6, "context"));
          char v13 = sub_1000179E0(v11, v12);

          if ((v13 & 1) != 0)
          {
            id v14 = -[EligibilityDomain supportedInputs](self, "supportedInputs");
            if (v14 == (id)-[EligibilityDomain supportedInputs](v6, "supportedInputs"))
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
              unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](v6, "locatedCountriesOfInterest"));
              char v17 = sub_1000179E0(v15, v16);

              if ((v17 & 1) != 0)
              {
                unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
                id v19 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](v6, "billingCountriesOfInterest"));
                char v20 = sub_1000179E0(v18, v19);

                if ((v20 & 1) != 0)
                {
                  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
                  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](v6, "deviceClassesOfInterest"));
                  char v23 = sub_1000179E0(v21, v22);

                  if ((v23 & 1) != 0)
                  {
                    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](v6, "deviceLocalesOfInterest"));
                    char v26 = sub_1000179E0(v24, v25);

                    if ((v26 & 1) != 0)
                    {
                      v27 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
                      v28 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](v6, "deviceLanguagesOfInterest"));
                      char v29 = sub_1000179E0(v27, v28);

                      if ((v29 & 1) != 0)
                      {
                        v30 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
                        v31 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](v6, "locatedCountryTimer"));
                        char v32 = sub_1000179E0(v30, v31);

                        if ((v32 & 1) != 0)
                        {
                          v33 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityDomain deviceRegionCodesOfInterest]( self,  "deviceRegionCodesOfInterest"));
                          v34 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityDomain deviceRegionCodesOfInterest]( v6,  "deviceRegionCodesOfInterest"));
                          char v35 = sub_1000179E0(v33, v34);

                          if ((v35 & 1) != 0)
                          {
                            v36 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityDomain initialLocationsOfInterest]( self,  "initialLocationsOfInterest"));
                            v37 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityDomain initialLocationsOfInterest]( v6,  "initialLocationsOfInterest"));
                            char v38 = sub_1000179E0(v36, v37);

                            if ((v38 & 1) != 0)
                            {
                              v39 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain ageOfInterest](self, "ageOfInterest"));
                              v40 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain ageOfInterest](v6, "ageOfInterest"));
                              char v41 = sub_1000179E0(v39, v40);

                              if ((v41 & 1) != 0)
                              {
                                id v42 = -[EligibilityDomain inversionMask](self, "inversionMask");
                                if (v42 == (id)-[EligibilityDomain inversionMask](v6, "inversionMask"))
                                {
                                  BOOL v43 = 1;
LABEL_51:

                                  goto LABEL_52;
                                }

                                id v58 = sub_10000C968();
                                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 136315394;
                                  v62 = "-[EligibilityDomain isEqual:]";
                                  __int16 v63 = 2080;
                                  v64 = "inversionMask";
                                  goto LABEL_49;
                                }

- (id)_supportedInputsString
{
  unint64_t v3 = -[EligibilityDomain supportedInputs](self, "supportedInputs");
  unint64_t v4 = -[EligibilityDomain inversionMask](self, "inversionMask");
  if (v3)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0LL;
    id v7 = &stru_100035478;
    do
    {
      if ((v3 & 1) != 0)
      {
        uint64_t v12 = (char)[@"LBDRCSTMQAEP=Ia" characterAtIndex:v6];
        if ((v5 & 1) != 0) {
          uint64_t v8 = 33LL;
        }
        else {
          uint64_t v8 = 95LL;
        }
        uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%c%c", v7, v8, v12));

        id v7 = (__CFString *)v9;
      }

      ++v6;
      v5 >>= 1;
      BOOL v10 = v3 > 1;
      v3 >>= 1;
    }

    while (v10);
  }

  else
  {
    id v7 = &stru_100035478;
  }

  return v7;
}

- (id)_interestedDataString
{
  unsigned __int16 v3 = (unsigned __int16)-[EligibilityDomain supportedInputs](self, "supportedInputs");
  unsigned __int16 v4 = v3;
  if ((v3 & 1) == 0)
  {
    unint64_t v5 = &stru_100035478;
    if ((v3 & 2) == 0) {
      goto LABEL_9;
    }
LABEL_8:
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" billingCountries: %@", v12));

    unint64_t v5 = (__CFString *)v13;
    goto LABEL_9;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  id v7 = v6;
  if (v6) {
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 description]);
  }
  else {
    uint64_t v8 = @"<NULL>";
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
  unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue( [&stru_100035478 stringByAppendingFormat:@" locatedCountries: %@ gracePeriod: %@", v10, v8]);

  if ((v4 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_9:
  if ((v4 & 4) != 0)
  {
    char v17 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" deviceClasses: %@", v18));

    unint64_t v5 = (__CFString *)v19;
    if ((v4 & 8) == 0)
    {
LABEL_11:
      if ((v4 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
  }

  else if ((v4 & 8) == 0)
  {
    goto LABEL_11;
  }

  char v20 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 description]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" deviceLocales: %@", v21));

  unint64_t v5 = (__CFString *)v22;
  if ((v4 & 0x10) == 0)
  {
LABEL_12:
    if ((v4 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }

- (id)description
{
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain _supportedInputsString](self, "_supportedInputsString"));
  id v4 = sub_10000C814(-[EligibilityDomain answer](self, "answer"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = -[EligibilityDomain answerSource](self, "answerSource");
  if (v6 >= 3)
  {
    id v8 = sub_10000C968();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      char v20 = "eligibility_answer_source_to_str";
      __int16 v21 = 2048;
      unint64_t v22 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Unsupported answer source: %llu",  buf,  0x16u);
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<Unknown: %llu>", v6));
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", (&off_100034AA0)[v6]));
  }

  BOOL v10 = (void *)v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain _interestedDataString](self, "_interestedDataString"));
  unint64_t v12 = -[EligibilityDomain domain](self, "domain");
  unint64_t v13 = v12;
  if (v12 > 0x7D) {
    id v14 = "<Unknown Domain>";
  }
  else {
    id v14 = off_1000345B8[v12];
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  char v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Domain: %s(%llu)>(%@) - <answer: %@, source: %@, context: %@, status: %@> - <%@>>",  v14,  v13,  v3,  v5,  v10,  v15,  v16,  v11));

  return v17;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (unint64_t)supportedInputs
{
  return self->_supportedInputs;
}

- (void)setSupportedInputs:(unint64_t)a3
{
  self->_supportedInputs = a3;
}

- (NSSet)locatedCountriesOfInterest
{
  return self->_locatedCountriesOfInterest;
}

- (NSSet)billingCountriesOfInterest
{
  return self->_billingCountriesOfInterest;
}

- (NSSet)deviceClassesOfInterest
{
  return self->_deviceClassesOfInterest;
}

- (NSSet)deviceLocalesOfInterest
{
  return self->_deviceLocalesOfInterest;
}

- (NSSet)deviceRegionCodesOfInterest
{
  return self->_deviceRegionCodesOfInterest;
}

- (NSSet)deviceLanguagesOfInterest
{
  return self->_deviceLanguagesOfInterest;
}

- (NSSet)initialLocationsOfInterest
{
  return self->_initialLocationsOfInterest;
}

- (void)setInitialLocationsOfInterest:(id)a3
{
}

- (NSNumber)ageOfInterest
{
  return self->_ageOfInterest;
}

- (void)setAgeOfInterest:(id)a3
{
}

- (unint64_t)inversionMask
{
  return self->_inversionMask;
}

- (void)setInversionMask:(unint64_t)a3
{
  self->_inversionMask = a3;
}

- (EligibilityTimer)locatedCountryTimer
{
  return self->_locatedCountryTimer;
}

- (void)setLocatedCountryTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end