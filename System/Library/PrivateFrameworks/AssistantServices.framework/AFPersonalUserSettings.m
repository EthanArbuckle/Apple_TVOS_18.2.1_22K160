@interface AFPersonalUserSettings
+ (BOOL)supportsSecureCoding;
- (AFPersonalUserSettings)initWithCoder:(id)a3;
- (BOOL)twentyFourHourTimeDisplay;
- (NSString)countryCode;
- (NSString)preferredLanguage;
- (NSString)region;
- (NSString)temperatureUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setRegion:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setTwentyFourHourTimeDisplay:(BOOL)a3;
@end

@implementation AFPersonalUserSettings

- (void)encodeWithCoder:(id)a3
{
  temperatureUnit = self->_temperatureUnit;
  id v5 = a3;
  [v5 encodeObject:temperatureUnit forKey:@"_temperatureUnit"];
  [v5 encodeBool:self->_twentyFourHourTimeDisplay forKey:@"_twentyFourHourTimeDisplay"];
  [v5 encodeObject:self->_region forKey:@"_region"];
  [v5 encodeObject:self->_countryCode forKey:@"_countryCode"];
  [v5 encodeObject:self->_preferredLanguage forKey:@"_preferredLanguage"];
}

- (AFPersonalUserSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AFPersonalUserSettings;
  id v5 = -[AFPersonalUserSettings init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_temperatureUnit"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    temperatureUnit = v5->_temperatureUnit;
    v5->_temperatureUnit = (NSString *)v7;

    v5->_twentyFourHourTimeDisplay = [v4 decodeBoolForKey:@"_twentyFourHourTimeDisplay"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_region"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    region = v5->_region;
    v5->_region = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_countryCode"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_preferredLanguage"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v16;
  }

  return v5;
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setTemperatureUnit:(id)a3
{
}

- (BOOL)twentyFourHourTimeDisplay
{
  return self->_twentyFourHourTimeDisplay;
}

- (void)setTwentyFourHourTimeDisplay:(BOOL)a3
{
  self->_twentyFourHourTimeDisplay = a3;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPreferredLanguage:(id)a3
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