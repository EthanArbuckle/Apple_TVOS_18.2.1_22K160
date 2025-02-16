@interface SHAudioEnvironment
- (AVAudioSession)audioSession;
- (BOOL)isOtherAudioPlaying;
- (BOOL)isUsingAlternativeOutputToBuiltInSpeaker;
- (SHAudioEnvironment)init;
- (void)setAudioSession:(id)a3;
@end

@implementation SHAudioEnvironment

- (SHAudioEnvironment)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SHAudioEnvironment;
  v2 = -[SHAudioEnvironment init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    audioSession = v2->_audioSession;
    v2->_audioSession = (AVAudioSession *)v3;
  }

  return v2;
}

- (BOOL)isUsingAlternativeOutputToBuiltInSpeaker
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioEnvironment audioSession](self, "audioSession", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentRoute]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputs]);

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) portType]);
        unsigned int v10 = [v9 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

        if (!v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isOtherAudioPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  unsigned __int8 v3 = [v2 isOtherAudioPlaying];

  return v3;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end