@interface CSSmartSiriVolumeEstimate
+ (BOOL)supportsSecureCoding;
- (CSSmartSiriVolumeEstimate)initWithCoder:(id)a3;
- (CSSmartSiriVolumeEstimate)initWithVolumeEstimate:(float)a3 debugLogFile:(id)a4;
- (NSString)debugLogPath;
- (float)volumeEstimate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSSmartSiriVolumeEstimate

- (CSSmartSiriVolumeEstimate)initWithVolumeEstimate:(float)a3 debugLogFile:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeEstimate;
  v8 = -[CSSmartSiriVolumeEstimate init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_volumeEstimate = a3;
    objc_storeStrong((id *)&v8->_debugLogPath, a4);
  }

  return v9;
}

- (CSSmartSiriVolumeEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeEstimate;
  v6 = -[CSSmartSiriVolumeEstimate init](&v15, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v5),  @"estimatedTTSVolume");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v8 floatValue];
    v6->_volumeEstimate = v9;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"debugLogPath");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    debugLogPath = v6->_debugLogPath;
    v6->_debugLogPath = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  float volumeEstimate = self->_volumeEstimate;
  id v7 = a3;
  *(float *)&double v5 = volumeEstimate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5));
  [v7 encodeObject:v6 forKey:@"estimatedTTSVolume"];

  [v7 encodeObject:self->_debugLogPath forKey:@"debugLogPath"];
}

- (float)volumeEstimate
{
  return self->_volumeEstimate;
}

- (NSString)debugLogPath
{
  return self->_debugLogPath;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end