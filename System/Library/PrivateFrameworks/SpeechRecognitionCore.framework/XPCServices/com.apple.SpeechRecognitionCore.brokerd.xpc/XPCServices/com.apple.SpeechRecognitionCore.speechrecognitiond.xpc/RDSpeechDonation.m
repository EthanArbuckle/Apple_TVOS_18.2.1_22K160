@interface RDSpeechDonation
+ (id)convertRawAudiotoPCM:(const signed __int16 *)a3 count:(unsigned int)a4;
- (NSArray)audioBuffers;
- (NSDate)recordingStartDate;
- (NSLocale)locale;
- (NSMutableArray)audioPCMBuffers;
- (NSString)donorBundleID;
- (NSString)donorReferenceID;
- (NSString)taskHint;
- (NSString)transcription;
- (RDSpeechDonation)initWithBundleID:(id)a3 donorReferenceID:(id)a4 locale:(id)a5 taskHint:(id)a6;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)_speechDonation;
- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)donateAudioFor:(id)a3 logAudioFile:(BOOL)a4;
- (void)setAudioBuffers:(id)a3;
- (void)setAudioPCMBuffers:(id)a3;
- (void)setDonorBundleID:(id)a3;
- (void)setDonorReferenceID:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRecordingStartDate:(id)a3;
- (void)setTaskHint:(id)a3;
- (void)setTranscription:(id)a3;
- (void)set_speechDonation:(id)a3;
@end

@implementation RDSpeechDonation

- (RDSpeechDonation)initWithBundleID:(id)a3 donorReferenceID:(id)a4 locale:(id)a5 taskHint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RDSpeechDonation;
  v14 = -[RDSpeechDonation init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    -[RDSpeechDonation setDonorBundleID:](v14, "setDonorBundleID:", v10);
    -[RDSpeechDonation setDonorReferenceID:](v15, "setDonorReferenceID:", v11);
    -[RDSpeechDonation setLocale:](v15, "setLocale:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[RDSpeechDonation setRecordingStartDate:](v15, "setRecordingStartDate:", v16);

    -[RDSpeechDonation setTaskHint:](v15, "setTaskHint:", v13);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[RDSpeechDonation setAudioPCMBuffers:](v15, "setAudioPCMBuffers:", v17);
  }

  return v15;
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation audioPCMBuffers](self, "audioPCMBuffers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[RDSpeechDonation convertRawAudiotoPCM:count:]( &OBJC_CLASS___RDSpeechDonation,  "convertRawAudiotoPCM:count:",  a3,  a4));
  [v7 addObject:v6];
}

- (void)donateAudioFor:(id)a3 logAudioFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation donorBundleID](self, "donorBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation donorReferenceID](self, "donorReferenceID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation recordingStartDate](self, "recordingStartDate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation locale](self, "locale"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation taskHint](self, "taskHint"));
  id v13 = -[RDSwiftSpeechDonation initWithDonorBundleID:donorReferenceID:recordingDate:locale:taskHint:transcription:]( v7,  "initWithDonorBundleID:donorReferenceID:recordingDate:locale:taskHint:transcription:",  v8,  v9,  v10,  v11,  v12,  v6);

  -[RDSpeechDonation set_speechDonation:](self, "set_speechDonation:", v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[RDSpeechDonation _speechDonation](self, "_speechDonation"));
  [v14 donateWithAudioBuffers:self->_audioPCMBuffers logAudioFile:v4];
}

+ (id)convertRawAudiotoPCM:(const signed __int16 *)a3 count:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  __int128 v10 = xmmword_1000AC338;
  __int128 v11 = unk_1000AC348;
  uint64_t v12 = 16LL;
  id v6 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  &v10);
  id v7 = objc_alloc(&OBJC_CLASS___AVAudioPCMBuffer);
  v8 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( v7,  "initWithPCMFormat:frameCapacity:",  v6,  v4,  v10,  v11,  v12);
  memcpy(*(void **)-[AVAudioPCMBuffer int16ChannelData](v8, "int16ChannelData"), a3, 2LL * v4);
  -[AVAudioPCMBuffer setFrameLength:](v8, "setFrameLength:", v4);

  return v8;
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)_speechDonation
{
  return self->__speechDonation;
}

- (void)set_speechDonation:(id)a3
{
}

- (NSString)donorBundleID
{
  return self->_donorBundleID;
}

- (void)setDonorBundleID:(id)a3
{
}

- (NSString)donorReferenceID
{
  return self->_donorReferenceID;
}

- (void)setDonorReferenceID:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)audioBuffers
{
  return self->_audioBuffers;
}

- (void)setAudioBuffers:(id)a3
{
}

- (NSDate)recordingStartDate
{
  return self->_recordingStartDate;
}

- (void)setRecordingStartDate:(id)a3
{
}

- (NSString)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(id)a3
{
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (NSMutableArray)audioPCMBuffers
{
  return self->_audioPCMBuffers;
}

- (void)setAudioPCMBuffers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end