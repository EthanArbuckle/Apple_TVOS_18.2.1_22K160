@interface CSVTRejectEventMetadata
- (CSVTRejectEventMetadata)initWithEventType:(unint64_t)a3 score:(float)a4 threshold:(float)a5 deltaTime:(double)a6;
- (double)deltaTimeFromActivation;
- (float)score;
- (float)threshold;
- (id)description;
- (unint64_t)eventType;
- (void)setDeltaTimeFromActivation:(double)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setScore:(float)a3;
- (void)setThreshold:(float)a3;
@end

@implementation CSVTRejectEventMetadata

- (CSVTRejectEventMetadata)initWithEventType:(unint64_t)a3 score:(float)a4 threshold:(float)a5 deltaTime:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSVTRejectEventMetadata;
  result = -[CSVTRejectEventMetadata init](&v11, "init");
  if (result)
  {
    result->_eventType = a3;
    result->_score = a4;
    result->_threshold = a5;
    result->_deltaTimeFromActivation = a6;
  }

  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Type:%lu Score:%.3f Threshold:%.3f DeltaTime:%lu",  self->_eventType,  self->_score,  self->_threshold,  (unint64_t)self->_deltaTimeFromActivation);
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (double)deltaTimeFromActivation
{
  return self->_deltaTimeFromActivation;
}

- (void)setDeltaTimeFromActivation:(double)a3
{
  self->_deltaTimeFromActivation = a3;
}

@end