@interface AVAudioDeviceTestSequence
+ (BOOL)supportsSecureCoding;
- (AVAudioDeviceTestProcessingChain)inputProcessingChain;
- (AVAudioDeviceTestProcessingChain)outputProcessingChain;
- (AVAudioDeviceTestSequence)init;
- (AVAudioDeviceTestSequence)initWithCoder:(id)a3;
- (BOOL)calculateCrossCorrelationPeak;
- (BOOL)parallelCrossCorrelationCalculation;
- (BOOL)processSequenceAsynchronously;
- (BOOL)requiresBluetoothOutput;
- (NSArray)micBufferNumbers;
- (NSString)microphone;
- (NSString)mode;
- (NSURL)stimulusURL;
- (float)volume;
- (int64_t)numberOfChannels;
- (int64_t)outputID;
- (int64_t)outputMode;
- (int64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setCalculateCrossCorrelationPeak:(BOOL)a3;
- (void)setInputProcessingChain:(id)a3;
- (void)setMicBufferNumbers:(id)a3;
- (void)setMicrophone:(id)a3;
- (void)setMode:(id)a3;
- (void)setNumberOfChannels:(int64_t)a3;
- (void)setOutputID:(int64_t)a3;
- (void)setOutputMode:(int64_t)a3;
- (void)setOutputProcessingChain:(id)a3;
- (void)setParallelCrossCorrelationCalculation:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProcessSequenceAsynchronously:(BOOL)a3;
- (void)setRequiresBluetoothOutput:(BOOL)a3;
- (void)setStimulusURL:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation AVAudioDeviceTestSequence

- (AVAudioDeviceTestSequence)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AVAudioDeviceTestSequence;
  v2 = -[AVAudioDeviceTestSequence init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    mode = v2->_mode;
    v2->_mode = 0LL;

    v3->_calculateCrossCorrelationPeak = 0;
    stimulusURL = v3->_stimulusURL;
    v3->_stimulusURL = 0LL;

    v3->_outputID = 0LL;
    v3->_outputMode = 0LL;
    v3->_volume = 0.5;
    inputProcessingChain = v3->_inputProcessingChain;
    v3->_inputProcessingChain = 0LL;

    outputProcessingChain = v3->_outputProcessingChain;
    v3->_outputProcessingChain = 0LL;

    v3->_processSequenceAsynchronously = 0;
    v3->_parallelCrossCorrelationCalculation = 0;
    micBufferNumbers = v3->_micBufferNumbers;
    v3->_numberOfChannels = 0LL;
    v3->_micBufferNumbers = (NSArray *)&__NSArray0__struct;

    v3->_requiresBluetoothOutput = 0;
    microphone = v3->_microphone;
    v3->_microphone = 0LL;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  stimulusURL = self->_stimulusURL;
  id v6 = a3;
  [v6 encodeObject:stimulusURL forKey:@"stimulusURL"];
  [v6 encodeInteger:self->_outputID forKey:@"outputID"];
  [v6 encodeInteger:self->_outputMode forKey:@"outputMode"];
  *(float *)&double v5 = self->_volume;
  [v6 encodeFloat:@"volume" forKey:v5];
  [v6 encodeObject:self->_inputProcessingChain forKey:@"inputProcessingChain"];
  [v6 encodeObject:self->_outputProcessingChain forKey:@"outputProcessingChain"];
  [v6 encodeObject:self->_mode forKey:@"mode"];
  [v6 encodeBool:self->_calculateCrossCorrelationPeak forKey:@"calculateCrossCorrelationPeak"];
  [v6 encodeBool:self->_processSequenceAsynchronously forKey:@"processSequenceAsynchronously"];
  [v6 encodeBool:self->_parallelCrossCorrelationCalculation forKey:@"parallelCrossCorrelationCalculation"];
  [v6 encodeInteger:self->_numberOfChannels forKey:@"numberOfChannels"];
  [v6 encodeObject:self->_micBufferNumbers forKey:@"micBufferNumbers"];
  [v6 encodeBool:self->_requiresBluetoothOutput forKey:@"requiresBluetoothOutput"];
  [v6 encodeObject:self->_microphone forKey:@"microphone"];
}

- (AVAudioDeviceTestSequence)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___AVAudioDeviceTestSequence;
  double v5 = -[AVAudioDeviceTestSequence init](&v26, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"stimulusURL"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    stimulusURL = v5->_stimulusURL;
    v5->_stimulusURL = (NSURL *)v7;

    v5->_outputID = (int64_t)[v4 decodeIntegerForKey:@"outputID"];
    v5->_outputMode = (int64_t)[v4 decodeIntegerForKey:@"outputMode"];
    [v4 decodeFloatForKey:@"volume"];
    v5->_volume = v9;
    id v10 = [v4 decodeObjectOfClass:objc_opt_class(AVAudioDeviceTestProcessingChain) forKey:@"inputProcessingChain"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    inputProcessingChain = v5->_inputProcessingChain;
    v5->_inputProcessingChain = (AVAudioDeviceTestProcessingChain *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(AVAudioDeviceTestProcessingChain) forKey:@"outputProcessingChain"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    outputProcessingChain = v5->_outputProcessingChain;
    v5->_outputProcessingChain = (AVAudioDeviceTestProcessingChain *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"mode"];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    mode = v5->_mode;
    v5->_mode = (NSString *)v17;

    v5->_calculateCrossCorrelationPeak = [v4 decodeBoolForKey:@"calculateCrossCorrelationPeak"];
    v5->_processSequenceAsynchronously = [v4 decodeBoolForKey:@"processSequenceAsynchronously"];
    v5->_parallelCrossCorrelationCalculation = [v4 decodeBoolForKey:@"parallelCrossCorrelationCalculation"];
    v5->_numberOfChannels = (int64_t)[v4 decodeIntegerForKey:@"numberOfChannels"];
    id v19 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSNumber) forKey:@"micBufferNumbers"];
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    micBufferNumbers = v5->_micBufferNumbers;
    v5->_micBufferNumbers = (NSArray *)v20;

    v5->_requiresBluetoothOutput = [v4 decodeBoolForKey:@"requiresBluetoothOutput"];
    id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"microphone"];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    microphone = v5->_microphone;
    v5->_microphone = (NSString *)v23;
  }

  return v5;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (NSURL)stimulusURL
{
  return self->_stimulusURL;
}

- (void)setStimulusURL:(id)a3
{
}

- (AVAudioDeviceTestProcessingChain)inputProcessingChain
{
  return self->_inputProcessingChain;
}

- (void)setInputProcessingChain:(id)a3
{
}

- (AVAudioDeviceTestProcessingChain)outputProcessingChain
{
  return self->_outputProcessingChain;
}

- (void)setOutputProcessingChain:(id)a3
{
}

- (int64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputMode:(int64_t)a3
{
  self->_outputMode = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSString)mode
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setMode:(id)a3
{
}

- (BOOL)calculateCrossCorrelationPeak
{
  return self->_calculateCrossCorrelationPeak;
}

- (void)setCalculateCrossCorrelationPeak:(BOOL)a3
{
  self->_calculateCrossCorrelationPeak = a3;
}

- (BOOL)parallelCrossCorrelationCalculation
{
  return self->_parallelCrossCorrelationCalculation;
}

- (void)setParallelCrossCorrelationCalculation:(BOOL)a3
{
  self->_parallelCrossCorrelationCalculation = a3;
}

- (int64_t)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setNumberOfChannels:(int64_t)a3
{
  self->_numberOfChannels = a3;
}

- (NSArray)micBufferNumbers
{
  return self->_micBufferNumbers;
}

- (void)setMicBufferNumbers:(id)a3
{
}

- (BOOL)requiresBluetoothOutput
{
  return self->_requiresBluetoothOutput;
}

- (void)setRequiresBluetoothOutput:(BOOL)a3
{
  self->_requiresBluetoothOutput = a3;
}

- (NSString)microphone
{
  return self->_microphone;
}

- (void)setMicrophone:(id)a3
{
}

- (BOOL)processSequenceAsynchronously
{
  return self->_processSequenceAsynchronously;
}

- (void)setProcessSequenceAsynchronously:(BOOL)a3
{
  self->_processSequenceAsynchronously = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end