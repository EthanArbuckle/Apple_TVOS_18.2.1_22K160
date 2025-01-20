@interface SiriTTSSynthesisVoice
- (id)SAVoiceGender;
- (id)SAVoiceQuality;
- (id)SAVoiceType;
- (int64_t)AFVoiceFootprint;
- (int64_t)AFVoiceGender;
- (void)updateWithTargetVoice:(id)a3;
@end

@implementation SiriTTSSynthesisVoice

- (void)updateWithTargetVoice:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 language]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTTSSynthesisVoice language](self, "language"));
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    -[SiriTTSSynthesisVoice setLanguage:](self, "setLanguage:", v6);
  }
  id v9 = v13;
  if (v13)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTTSSynthesisVoice name](self, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
    unsigned __int8 v12 = [v13 isEqualToString:v11];

    id v9 = v13;
    if ((v12 & 1) == 0)
    {
      -[SiriTTSSynthesisVoice setName:](self, "setName:", v13);
      goto LABEL_8;
    }
  }

  if ((v8 & 1) == 0)
  {
LABEL_8:
    -[SiriTTSSynthesisVoice setFootprint:](self, "setFootprint:", 1LL);
    -[SiriTTSSynthesisVoice setType:](self, "setType:", 1LL);
    -[SiriTTSSynthesisVoice setVersion:](self, "setVersion:", 0LL);
    goto LABEL_9;
  }

  -[SiriTTSSynthesisVoice setName:](self, "setName:", v9);
LABEL_9:
}

- (int64_t)AFVoiceGender
{
  int64_t result = (int64_t)-[SiriTTSSynthesisVoice gender](self, "gender");
  return result;
}

- (int64_t)AFVoiceFootprint
{
  unint64_t v2 = (unint64_t)-[SiriTTSSynthesisVoice footprint](self, "footprint");
  if (v2 > 3) {
    return 0LL;
  }
  else {
    return qword_1003C9E28[v2];
  }
}

- (id)SAVoiceGender
{
  unint64_t v2 = (char *)-[SiriTTSSynthesisVoice gender](self, "gender");
  else {
    v3 = (id *)*(&off_1004F3BF8 + (void)(v2 - 1));
  }
  return *v3;
}

- (id)SAVoiceQuality
{
  id v2 = -[SiriTTSSynthesisVoice footprint](self, "footprint");
  else {
    v3 = (id *)*(&off_1004F3C10 + (void)v2);
  }
  return *v3;
}

- (id)SAVoiceType
{
  id v2 = (char *)-[SiriTTSSynthesisVoice type](self, "type");
  else {
    v3 = (id *)*(&off_1004F3C30 + (void)(v2 - 1));
  }
  return *v3;
}

@end