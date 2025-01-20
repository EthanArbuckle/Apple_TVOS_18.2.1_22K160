@interface ESBiomeAsrRecord
- (BOOL)hasRecognizedAnything;
- (BOOL)qualify;
- (ESBiomeAsrRecord)initWithAsrId:(id)a3 interactionId:(id)a4 language:(id)a5 taskName:(id)a6 samplingRate:(unint64_t)a7;
- (NSArray)recognizedNbest;
- (NSArray)recognizedTokens;
- (NSArray)selectedAlternatives;
- (NSString)asrId;
- (NSString)correctedText;
- (NSString)interactionId;
- (NSString)language;
- (NSString)recognizedText;
- (NSString)taskName;
- (unint64_t)samplingRate;
- (void)markRecognition;
- (void)sendEvent;
- (void)setCorrectedText:(id)a3;
- (void)setCorrectedText:(id)a3 interactionId:(id)a4;
- (void)setRecognizedNbest:(id)a3;
- (void)setRecognizedText:(id)a3;
- (void)setRecognizedTokens:(id)a3;
- (void)setSelectedAlternatives:(id)a3;
@end

@implementation ESBiomeAsrRecord

- (ESBiomeAsrRecord)initWithAsrId:(id)a3 interactionId:(id)a4 language:(id)a5 taskName:(id)a6 samplingRate:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ESBiomeAsrRecord;
  v16 = -[ESBiomeAsrRecord init](&v31, "init");
  if (v16)
  {
    if (![v15 isEqualToString:@"Dictation"]
      || ![v12 length]
      || ![v13 length]
      || ![v14 length]
      || !AFDeviceSupportsSiriUOD()
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences")),
          unsigned __int8 v18 = [v17 isDictationHIPAACompliant],
          v17,
          (v18 & 1) != 0)
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences")),
          id v20 = [v19 siriDataSharingOptInStatus],
          v19,
          v20 != (id)1))
    {
      v29 = 0LL;
      goto LABEL_12;
    }

    v21 = (NSString *)[v12 copy];
    asrId = v16->_asrId;
    v16->_asrId = v21;

    v23 = (NSString *)[v13 copy];
    interactionId = v16->_interactionId;
    v16->_interactionId = v23;

    v25 = (NSString *)[v14 copy];
    language = v16->_language;
    v16->_language = v25;

    v27 = (NSString *)[v15 copy];
    taskName = v16->_taskName;
    v16->_taskName = v27;

    v16->_samplingRate = a7;
  }

  v29 = v16;
LABEL_12:

  return v29;
}

- (void)markRecognition
{
  self->_hasRecognizedAnything = 1;
}

- (void)setCorrectedText:(id)a3 interactionId:(id)a4
{
  id v8 = a3;
  if ([a4 isEqualToString:self->_interactionId])
  {
    v6 = (NSString *)[v8 copy];
    correctedText = self->_correctedText;
    self->_correctedText = v6;
  }
}

- (BOOL)qualify
{
  if (self->_hasRecognizedAnything)
  {
    NSUInteger v3 = -[NSArray count](self->_recognizedTokens, "count");
    if (v3)
    {
      NSUInteger v3 = -[NSString length](self->_recognizedText, "length");
      if (v3)
      {
        NSUInteger v3 = -[NSString length](self->_correctedText, "length");
        if (v3) {
          LOBYTE(v3) = !-[NSString isEqualToString:](self->_recognizedText, "isEqualToString:", self->_correctedText);
        }
      }
    }
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)sendEvent
{
}

- (NSString)asrId
{
  return self->_asrId;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (void)setRecognizedTokens:(id)a3
{
}

- (NSArray)recognizedNbest
{
  return self->_recognizedNbest;
}

- (void)setRecognizedNbest:(id)a3
{
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedText:(id)a3
{
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCorrectedText:(id)a3
{
}

- (NSArray)selectedAlternatives
{
  return self->_selectedAlternatives;
}

- (void)setSelectedAlternatives:(id)a3
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