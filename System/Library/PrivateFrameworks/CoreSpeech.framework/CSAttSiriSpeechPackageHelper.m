@interface CSAttSiriSpeechPackageHelper
+ (double)getFirstTokenDurationFromSpeechPackage:(id)a3;
+ (double)getFirstTokenLeadingSilenceFromSpeechPackage:(id)a3;
+ (double)getFirstTokenSilenceStartFromSpeechPackage:(id)a3;
+ (double)getLastTokenEndTimeFromSpeechPackage:(id)a3;
+ (double)getLastTokenSilenceStartFromSpeechPackage:(id)a3;
+ (double)getLastTokenTrailingSilenceFromSpeechPackage:(id)a3;
+ (id)_getFirstTokenFromSpeechPackage:(id)a3;
+ (id)_getLastTokenFromSpeechPackage:(id)a3;
@end

@implementation CSAttSiriSpeechPackageHelper

+ (double)getFirstTokenLeadingSilenceFromSpeechPackage:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getFirstTokenFromSpeechPackage:"));
  [v3 startTime];
  double v5 = v4;

  return v5;
}

+ (double)getFirstTokenDurationFromSpeechPackage:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getFirstTokenFromSpeechPackage:"));
  [v3 silenceStartTime];
  double v5 = v4;
  [v3 startTime];
  double v7 = v5 - v6;

  return v7;
}

+ (double)getFirstTokenSilenceStartFromSpeechPackage:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getFirstTokenFromSpeechPackage:"));
  [v3 silenceStartTime];
  double v5 = v4;

  return v5;
}

+ (double)getLastTokenSilenceStartFromSpeechPackage:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getLastTokenFromSpeechPackage:"));
  [v3 silenceStartTime];
  double v5 = v4;

  return v5;
}

+ (double)getLastTokenEndTimeFromSpeechPackage:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getLastTokenFromSpeechPackage:"));
  [v3 endTime];
  double v5 = v4;

  return v5;
}

+ (double)getLastTokenTrailingSilenceFromSpeechPackage:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getLastTokenFromSpeechPackage:"));
  [v3 endTime];
  double v5 = v4;
  [v3 silenceStartTime];
  double v7 = v5 - v6;

  return v7;
}

+ (id)_getFirstTokenFromSpeechPackage:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rawRecognition]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 phrases]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 interpretations]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tokens]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  return v9;
}

+ (id)_getLastTokenFromSpeechPackage:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rawRecognition]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 phrases]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 interpretations]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tokens]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);

  return v9;
}

@end