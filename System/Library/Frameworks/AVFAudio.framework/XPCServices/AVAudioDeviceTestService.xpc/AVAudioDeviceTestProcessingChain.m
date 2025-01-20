@interface AVAudioDeviceTestProcessingChain
+ (BOOL)supportsSecureCoding;
- (AVAudioDeviceTestProcessingChain)initWithCoder:(id)a3;
- (NSURL)graphURL;
- (NSURL)processingStripURL;
- (void)encodeWithCoder:(id)a3;
- (void)setGraphURL:(id)a3;
- (void)setProcessingStripURL:(id)a3;
@end

@implementation AVAudioDeviceTestProcessingChain

- (void)encodeWithCoder:(id)a3
{
  graphURL = self->_graphURL;
  id v5 = a3;
  [v5 encodeObject:graphURL forKey:@"graphURL"];
  [v5 encodeObject:self->_processingStripURL forKey:@"processingStripURL"];
}

- (AVAudioDeviceTestProcessingChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AVAudioDeviceTestProcessingChain;
  id v5 = -[AVAudioDeviceTestProcessingChain init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"graphURL"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    graphURL = v5->_graphURL;
    v5->_graphURL = (NSURL *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"processingStripURL"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    processingStripURL = v5->_processingStripURL;
    v5->_processingStripURL = (NSURL *)v10;
  }

  return v5;
}

- (NSURL)graphURL
{
  return self->_graphURL;
}

- (void)setGraphURL:(id)a3
{
}

- (NSURL)processingStripURL
{
  return self->_processingStripURL;
}

- (void)setProcessingStripURL:(id)a3
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