@interface TITesterUtils
+ (id)decomposeDiphthong:(unsigned __int16)a3;
+ (id)decomposeDoublePatchim:(unsigned __int16)a3;
+ (id)decomposeHangul:(unsigned __int16)a3;
+ (id)decomposeHangulSequence:(id)a3;
@end

@implementation TITesterUtils

+ (id)decomposeDiphthong:(unsigned __int16)a3
{
  unsigned __int16 v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v8,  1LL));
  id v4 = [@"ㅘㅙㅚㅝㅞㅟㅢ" rangeOfString:v3];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([&off_90550 objectAtIndex:v4]);
  }
  v6 = v5;

  return v6;
}

+ (id)decomposeDoublePatchim:(unsigned __int16)a3
{
  unsigned __int16 v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v8,  1LL));
  id v4 = [@"ㄳㄵㄶㄺㄻㄼㄽㄾㄿㅀㅄ" rangeOfString:v3];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([&off_90568 objectAtIndex:v4]);
  }
  v6 = v5;

  return v6;
}

+ (id)decomposeHangul:(unsigned __int16)a3
{
  unsigned __int16 v14 = a3;
  if ((a3 - 12623) <= 0x14)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TITesterUtils decomposeDiphthong:](&OBJC_CLASS___TITesterUtils, "decomposeDiphthong:"));
    return v3;
  }

  if ((unsigned __int16)(a3 + 10332) <= 0xD45Bu)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v14,  1LL));
    return v3;
  }

  uint64_t v5 = (unsigned __int16)(a3 + 21504) / 0x24Cu;
  unsigned __int16 v6 = (unsigned __int16)(a3 + 21504) % 0x24Cu;
  uint64_t v7 = v6 / 0x1Cu;
  unsigned int v8 = v6 % 0x1Cu;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  unsigned __int16 v13 = (unsigned __int16)[@"ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ" characterAtIndex:v5];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v13,  1LL));
  [v9 appendString:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TITesterUtils decomposeDiphthong:]( TITesterUtils,  "decomposeDiphthong:",  [@"ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ" characterAtIndex:v7]));
  [v9 appendString:v11];
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TITesterUtils decomposeDoublePatchim:]( TITesterUtils,  "decomposeDoublePatchim:",  [@"ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ" characterAtIndex:v8 - 1]));
    [v9 appendString:v12];
  }

  return v9;
}

+ (id)decomposeHangulSequence:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v5 = (char *)[v3 length];
  if (v5)
  {
    unsigned __int16 v6 = v5;
    for (i = 0LL; i != v6; ++i)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[TITesterUtils decomposeHangul:]( TITesterUtils,  "decomposeHangul:",  [v3 characterAtIndex:i]));
      [v4 appendString:v8];
    }
  }

  return v4;
}

@end