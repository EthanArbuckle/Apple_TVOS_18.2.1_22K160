@interface MAAsset
- (BOOL)_es_isCompatibleWithThisDevice;
- (BOOL)_es_isDownloading;
- (BOOL)_es_isInstalled;
- (id)_es_contentVersion;
- (id)_es_description;
- (id)_es_language;
- (id)_es_masteredVersion;
- (id)_es_path;
- (id)_es_quasarDir;
- (id)_es_quasarModelPath;
- (int64_t)_es_compareByVersion:(id)a3;
- (int64_t)_es_requiredCapabilityIdentifier;
- (int64_t)_es_status;
@end

@implementation MAAsset

- (int64_t)_es_requiredCapabilityIdentifier
{
  return (int64_t)objc_msgSend( objc_msgSend( -[MAAsset attributes](self, "attributes"),  "objectForKey:",  @"RequiredCapabilityIdentifier"),  "integerValue");
}

- (BOOL)_es_isCompatibleWithThisDevice
{
  uint64_t v3 = -[MAAsset _es_requiredCapabilityIdentifier](self, "_es_requiredCapabilityIdentifier");
  if (v3 > AFDeviceHighestLanguageModelCapabilityIdentifier()) {
    return 0;
  }
  objc_msgSend( +[_EARSpeechRecognizer minimumSupportedConfigurationVersion]( _EARSpeechRecognizer,  "minimumSupportedConfigurationVersion"),  "floatValue");
  float v6 = v5;
  objc_msgSend( +[_EARSpeechRecognizer maximumSupportedConfigurationVersion]( _EARSpeechRecognizer,  "maximumSupportedConfigurationVersion"),  "floatValue");
  float v8 = v7;
  objc_msgSend( objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"FormatVersion"),  "floatValue");
  return v9 <= v8 && v9 >= v6;
}

- (id)_es_description
{
  id v3 = -[MAAsset _es_contentVersion](self, "_es_contentVersion");
  id v4 = -[MAAsset _es_masteredVersion](self, "_es_masteredVersion");
  unsigned int v5 = -[MAAsset _es_isInstalled](self, "_es_isInstalled");
  id v6 = -[MAAsset _es_language](self, "_es_language");
  if (-[MAAsset _es_isInstalled](self, "_es_isInstalled")) {
    float v7 = -[MAAsset _es_path](self, "_es_path");
  }
  else {
    float v7 = &stru_100019148;
  }
  float v8 = @"NO";
  if (v5) {
    float v8 = @"YES";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset: content version: %@, mastered version %@, installed %@, language: %@, path: %@",  v3,  v4,  v8,  v6,  v7);
}

- (id)_es_language
{
  return objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"Language");
}

- (id)_es_masteredVersion
{
  id v2 = -[MAAsset attributes](self, "attributes");
  return [v2 objectForKey:ASAttributeMasteredVersion];
}

- (id)_es_contentVersion
{
  id v2 = -[MAAsset attributes](self, "attributes");
  id v3 = [v2 objectForKey:ASAttributeContentVersion];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
      return [v3 stringValue];
    }
    return @"0";
  }

  return v3;
}

- (id)_es_path
{
  id result = -[MAAsset getLocalUrl](self, "getLocalUrl");
  if (result) {
    return objc_msgSend(-[MAAsset getLocalUrl](self, "getLocalUrl"), "path");
  }
  return result;
}

- (BOOL)_es_isInstalled
{
  return -[MAAsset state](self, "state") == (id)2 || -[MAAsset state](self, "state") == (id)3;
}

- (BOOL)_es_isDownloading
{
  return -[MAAsset state](self, "state") == (id)4;
}

- (int64_t)_es_status
{
  id v2 = (char *)-[MAAsset state](self, "state");
  else {
    return qword_100014268[(void)(v2 - 1)];
  }
}

- (id)_es_quasarModelPath
{
  id v3 = -[MAAsset _es_path](self, "_es_path");
  if (v3
    && (uint64_t v4 = v3,
        (id v5 = objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"QuasarDir")) != 0))
  {
    return [v4 stringByAppendingPathComponent:v5];
  }

  else
  {
    return 0LL;
  }

- (id)_es_quasarDir
{
  return objc_msgSend(-[MAAsset attributes](self, "attributes"), "objectForKey:", @"QuasarDir");
}

- (int64_t)_es_compareByVersion:(id)a3
{
  int64_t result = (int64_t)objc_msgSend( -[MAAsset _es_contentVersion](self, "_es_contentVersion"),  "compare:options:",  objc_msgSend(a3, "_es_contentVersion"),  64);
  if (!result)
  {
    id v6 = -[MAAsset _es_masteredVersion](self, "_es_masteredVersion");
    id v7 = objc_msgSend(a3, "_es_masteredVersion");
    if (v6 && v7)
    {
      int64_t result = (int64_t)[v6 compare:v7 options:64];
      if (result) {
        return result;
      }
    }

    else
    {
      if (v6 && !v7) {
        return 1LL;
      }
      if (!v6 && v7) {
        return -1LL;
      }
    }

    id v8 = -[MAAsset _es_path](self, "_es_path");
    id v9 = objc_msgSend(a3, "_es_path");
    if (v8 && v9)
    {
      int64_t result = (int64_t)[v8 compare:v9];
      if (result) {
        return result;
      }
      return 0LL;
    }

    if (v8 && !v9) {
      return 1LL;
    }
    if (v8 || !v9) {
      return 0LL;
    }
    return -1LL;
  }

  return result;
}

@end