@interface ESBiomeRecord
- (BOOL)hasRecognizedAnything;
- (NSString)applicationName;
- (NSString)interactionId;
- (NSString)taskName;
- (double)recognitionEndTime;
- (void)markRecognition;
- (void)setApplicationName:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setRecognitionEndTime:(double)a3;
- (void)setTaskName:(id)a3;
@end

@implementation ESBiomeRecord

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (double)recognitionEndTime
{
  return self->_recognitionEndTime;
}

- (void)setRecognitionEndTime:(double)a3
{
  self->_recognitionEndTime = a3;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

- (BOOL)hasRecognizedAnything
{
  return self->_hasRecognizedAnything;
}

- (void).cxx_destruct
{
}

@end