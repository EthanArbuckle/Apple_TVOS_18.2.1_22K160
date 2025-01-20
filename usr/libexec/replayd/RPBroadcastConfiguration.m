@interface RPBroadcastConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDictionary)videoCompressionProperties;
- (NSTimeInterval)clipDuration;
- (RPBroadcastConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setClipDuration:(NSTimeInterval)clipDuration;
- (void)setVideoCompressionProperties:(NSDictionary *)videoCompressionProperties;
@end

@implementation RPBroadcastConfiguration

- (RPBroadcastConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPBroadcastConfiguration;
  v5 = -[RPBroadcastConfiguration init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"clipDuration"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v7 doubleValue];
    v5->_clipDuration = v8;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSDictionary) forKey:@"videoCompressionProperties"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    videoCompressionProperties = v5->_videoCompressionProperties;
    v5->_videoCompressionProperties = (NSDictionary *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_clipDuration));
  [v7 encodeObject:v4 forKey:@"clipDuration"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_videoCompressionProperties, "allValues"));
  id v6 = [v5 count];

  if (v6) {
    [v7 encodeObject:self->_videoCompressionProperties forKey:@"videoCompressionProperties"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeInterval)clipDuration
{
  return self->_clipDuration;
}

- (void)setClipDuration:(NSTimeInterval)clipDuration
{
  self->_clipDuration = clipDuration;
}

- (NSDictionary)videoCompressionProperties
{
  return self->_videoCompressionProperties;
}

- (void)setVideoCompressionProperties:(NSDictionary *)videoCompressionProperties
{
}

- (void).cxx_destruct
{
}

@end