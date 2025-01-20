@interface AFPreferences
- (id)_ad_connectionModeFromEnabledState;
@end

@implementation AFPreferences

- (id)_ad_connectionModeFromEnabledState
{
  id v3 = -[AFPreferences assistantIsEnabled](self, "assistantIsEnabled");
  if ((v3 & 1) != 0)
  {
    unsigned int v5 = 1;
  }

  else if (AFSupportsRemoraHost(v3, v4))
  {
    unsigned int v5 = -[AFPreferences remoraHostEnabled](self, "remoraHostEnabled");
  }

  else
  {
    unsigned int v5 = 0;
  }

  unsigned int v6 = -[AFPreferences dictationIsEnabled](self, "dictationIsEnabled");
  int v7 = v6 ^ 1;
  if (((v5 ^ 1) & 1) == 0 && !v7)
  {
    v8 = (id *)&SAConnectionModeAssistantAndDictationValue;
LABEL_14:
    id v9 = *v8;
    return v9;
  }

  if ((v5 ^ 1 | v6) != 1)
  {
    v8 = (id *)&SAConnectionModeAssistantValue;
    goto LABEL_14;
  }

  if (((v5 | v7) & 1) == 0)
  {
    v8 = (id *)&SAConnectionModeDictationValue;
    goto LABEL_14;
  }

  id v9 = 0LL;
  return v9;
}

@end