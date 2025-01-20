@interface CSCoreSpeechServicesAccessoryInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsAlwaysOnAccelerometer;
- (BOOL)supportsJustSiri;
- (CSCoreSpeechServicesAccessoryInfo)init;
- (CSCoreSpeechServicesAccessoryInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsAlwaysOnAccelerometer:(BOOL)a3;
- (void)setSupportsJustSiri:(BOOL)a3;
@end

@implementation CSCoreSpeechServicesAccessoryInfo

- (CSCoreSpeechServicesAccessoryInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSCoreSpeechServicesAccessoryInfo;
  result = -[CSCoreSpeechServicesAccessoryInfo init](&v3, "init");
  if (result) {
    result->_supportsJustSiri = 0;
  }
  return result;
}

- (id)description
{
  v8[0] = @"sJS";
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_supportsJustSiri));
  v8[1] = @"sAlwaysOnAccelerometer";
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_supportsAlwaysOnAccelerometer));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___CSCoreSpeechServicesAccessoryInfo);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsJustSiri:](v4, "setSupportsJustSiri:", self->_supportsJustSiri);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsAlwaysOnAccelerometer:]( v4,  "setSupportsAlwaysOnAccelerometer:",  self->_supportsAlwaysOnAccelerometer);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL supportsJustSiri = self->_supportsJustSiri;
  id v5 = a3;
  [v5 encodeBool:supportsJustSiri forKey:@"sJS"];
  [v5 encodeBool:self->_supportsAlwaysOnAccelerometer forKey:@"sAlwaysOnAccelerometer"];
}

- (CSCoreSpeechServicesAccessoryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSCoreSpeechServicesAccessoryInfo;
  id v5 = -[CSCoreSpeechServicesAccessoryInfo init](&v7, "init");
  if (v5)
  {
    v5->_BOOL supportsJustSiri = [v4 decodeBoolForKey:@"sJS"];
    v5->_supportsAlwaysOnAccelerometer = [v4 decodeBoolForKey:@"sAlwaysOnAccelerometer"];
  }

  return v5;
}

- (BOOL)supportsJustSiri
{
  return self->_supportsJustSiri;
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  self->_BOOL supportsJustSiri = a3;
}

- (BOOL)supportsAlwaysOnAccelerometer
{
  return self->_supportsAlwaysOnAccelerometer;
}

- (void)setSupportsAlwaysOnAccelerometer:(BOOL)a3
{
  self->_supportsAlwaysOnAccelerometer = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end