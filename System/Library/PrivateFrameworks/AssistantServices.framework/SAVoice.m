@interface SAVoice
- (SAVoice)initWithSiriVoice:(id)a3;
@end

@implementation SAVoice

- (SAVoice)initWithSiriVoice:(id)a3
{
  id v4 = a3;
  v5 = -[SAVoice init](self, "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 language]);
  -[SAVoice setLanguageString:](v5, "setLanguageString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  -[SAVoice setName:](v5, "setName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 SAVoiceGender]);
  -[SAVoice setGender:](v5, "setGender:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 SAVoiceQuality]);
  -[SAVoice setQuality:](v5, "setQuality:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 SAVoiceType]);
  -[SAVoice setVoiceType:](v5, "setVoiceType:", v10);

  id v11 = [v4 version];
  -[SAVoice setVoiceContentVersion:](v5, "setVoiceContentVersion:", v11);
  return v5;
}

@end