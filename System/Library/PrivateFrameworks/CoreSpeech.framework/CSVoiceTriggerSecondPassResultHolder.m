@interface CSVoiceTriggerSecondPassResultHolder
- (BOOL)isSecondChanceCandidate;
- (CSVoiceTriggerSecondPassResultHolder)initWithResult:(unint64_t)a3 voiceTriggerEventInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5;
- (NSDictionary)voiceTriggerEventInfo;
- (id)description;
- (unint64_t)result;
@end

@implementation CSVoiceTriggerSecondPassResultHolder

- (CSVoiceTriggerSecondPassResultHolder)initWithResult:(unint64_t)a3 voiceTriggerEventInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder;
  v9 = -[CSVoiceTriggerSecondPassResultHolder init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_result = a3;
    v11 = (NSDictionary *)[v8 copy];
    voiceTriggerEventInfo = v10->_voiceTriggerEventInfo;
    v10->_voiceTriggerEventInfo = v11;

    v10->_isSecondChanceCandidate = a5;
  }

  return v10;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"result=%lu, isSecondChanceCandidate=%d, voiceTriggerEventInfo=%@",  self->_result,  self->_isSecondChanceCandidate,  self->_voiceTriggerEventInfo);
}

- (unint64_t)result
{
  return self->_result;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (BOOL)isSecondChanceCandidate
{
  return self->_isSecondChanceCandidate;
}

- (void).cxx_destruct
{
}

@end