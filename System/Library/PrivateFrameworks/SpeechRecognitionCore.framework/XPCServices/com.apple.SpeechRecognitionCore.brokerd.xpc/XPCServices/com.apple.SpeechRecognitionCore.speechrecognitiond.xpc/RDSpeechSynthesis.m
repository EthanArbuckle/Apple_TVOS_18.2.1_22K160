@interface RDSpeechSynthesis
+ (id)sharedManager;
- (AVSpeechSynthesizer)m_synth;
- (RDSpeechSynthesis)init;
- (void)_waitAndFinishSpeaking;
- (void)dealloc;
- (void)setM_synth:(id)a3;
- (void)speakString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 withCallback:(RDSpeechSynthesisCallback *)a6;
@end

@implementation RDSpeechSynthesis

+ (id)sharedManager
{
  if (qword_1000DDCB8 != -1) {
    dispatch_once(&qword_1000DDCB8, &stru_1000CDFC8);
  }
  return (id)qword_1000DDCC0;
}

- (RDSpeechSynthesis)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RDSpeechSynthesis;
  v2 = -[RDSpeechSynthesis init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AVSpeechSynthesizer);
    v2->_m_synth = v3;
    -[AVSpeechSynthesizer setDelegate:](v3, "setDelegate:", v2);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RDSpeechSynthesis;
  -[RDSpeechSynthesis dealloc](&v3, "dealloc");
}

- (void)speakString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 withCallback:(RDSpeechSynthesisCallback *)a6
{
  self->m_callback = *a6;
  v9 = +[AVSpeechUtterance speechUtteranceWithString:]( &OBJC_CLASS___AVSpeechUtterance,  "speechUtteranceWithString:",  a3);
  -[AVSpeechUtterance setVoice:]( v9,  "setVoice:",  +[AVSpeechSynthesisVoice voiceWithLanguage:](&OBJC_CLASS___AVSpeechSynthesisVoice, "voiceWithLanguage:", a5));
  LODWORD(v10) = 0.5;
  -[AVSpeechUtterance setRate:](v9, "setRate:", v10);
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  v16 = sub_10000A9E0;
  v17 = sub_10000A9F0;
  uint64_t v18 = 0LL;
  m_synth = self->_m_synth;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000A9FC;
  v12[3] = &unk_1000CDFF0;
  v12[4] = a4;
  v12[5] = &v13;
  -[AVSpeechSynthesizer writeUtterance:toBufferCallback:](m_synth, "writeUtterance:toBufferCallback:", v9, v12);
  -[RDSpeechSynthesis _waitAndFinishSpeaking](self, "_waitAndFinishSpeaking");

  v14[5] = 0LL;
  _Block_object_dispose(&v13, 8);
}

- (void)_waitAndFinishSpeaking
{
  if (-[AVSpeechSynthesizer isSpeaking](self->_m_synth, "isSpeaking"))
  {
    do
      usleep(0x186A0u);
    while (-[AVSpeechSynthesizer isSpeaking](self->_m_synth, "isSpeaking"));
  }

  ((void (*)(void *))self->m_callback.DidFinishSpeaking)(self->m_callback.ctx);
}

- (AVSpeechSynthesizer)m_synth
{
  return self->_m_synth;
}

- (void)setM_synth:(id)a3
{
}

@end