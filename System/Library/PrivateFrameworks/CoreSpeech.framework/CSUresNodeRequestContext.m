@interface CSUresNodeRequestContext
- (BOOL)shouldUpdateMitigationResult;
- (CSAudioRecordContext)recordCtx;
- (CSUresNodeRequestContext)init;
- (NSMutableDictionary)mitigationDecisions;
- (NSString)mhId;
- (NSString)requestId;
- (SLUresMitigatorIpFeats)inputFeats;
- (double)spkrIdAudioProcessedDuration;
- (id)description;
- (unint64_t)lastRCId;
- (void)setInputFeats:(id)a3;
- (void)setLastRCId:(unint64_t)a3;
- (void)setMhId:(id)a3;
- (void)setMitigationDecisions:(id)a3;
- (void)setRecordCtx:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setShouldUpdateMitigationResult:(BOOL)a3;
- (void)setSpkrIdAudioProcessedDuration:(double)a3;
@end

@implementation CSUresNodeRequestContext

- (CSUresNodeRequestContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSUresNodeRequestContext;
  return -[CSUresNodeRequestContext init](&v3, "init");
}

- (id)description
{
  mhId = self->_mhId;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext recordTypeString:]( &OBJC_CLASS___CSAudioRecordContext,  "recordTypeString:",  -[CSAudioRecordContext type](self->_recordCtx, "type")));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MHId %@ recordType %@",  mhId,  v3));

  return v4;
}

- (NSMutableDictionary)mitigationDecisions
{
  return self->_mitigationDecisions;
}

- (void)setMitigationDecisions:(id)a3
{
}

- (BOOL)shouldUpdateMitigationResult
{
  return self->_shouldUpdateMitigationResult;
}

- (void)setShouldUpdateMitigationResult:(BOOL)a3
{
  self->_shouldUpdateMitigationResult = a3;
}

- (SLUresMitigatorIpFeats)inputFeats
{
  return self->_inputFeats;
}

- (void)setInputFeats:(id)a3
{
}

- (CSAudioRecordContext)recordCtx
{
  return self->_recordCtx;
}

- (void)setRecordCtx:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
{
}

- (unint64_t)lastRCId
{
  return self->_lastRCId;
}

- (void)setLastRCId:(unint64_t)a3
{
  self->_lastRCId = a3;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (double)spkrIdAudioProcessedDuration
{
  return self->_spkrIdAudioProcessedDuration;
}

- (void)setSpkrIdAudioProcessedDuration:(double)a3
{
  self->_spkrIdAudioProcessedDuration = a3;
}

- (void).cxx_destruct
{
}

@end