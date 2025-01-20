@interface NSString
+ (NSString)stringWithUnichar:(unsigned __int16)a3;
- (_NSRange)lineFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (_NSRange)paragraphFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (_NSRange)sentenceFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (_NSRange)wordFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
- (id)wordStringFromPosition:(int64_t)a3 inDirection:(int64_t)a4;
@end

@implementation NSString

+ (NSString)stringWithUnichar:(unsigned __int16)a3
{
  unsigned __int16 v4 = a3;
  return (NSString *)[objc_allocWithZone(NSString) initWithCharacters:&v4 length:1];
}

- (_NSRange)sentenceFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTStringExtras.m",  32LL,  "-[NSString(VOTStringExtras) sentenceFromPosition:inDirection:]",  @"Unexpected text direction for getting line from position: %i");
  }
  id v7 = -[NSString ax_sentenceFromPosition:inDirection:](self, "ax_sentenceFromPosition:inDirection:", a3, a4 != 1);
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)paragraphFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTStringExtras.m",  38LL,  "-[NSString(VOTStringExtras) paragraphFromPosition:inDirection:]",  @"Unexpected text direction for getting line from position: %i");
  }
  id v7 = -[NSString ax_paragraphFromPosition:inDirection:](self, "ax_paragraphFromPosition:inDirection:", a3, a4 != 1);
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)lineFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTStringExtras.m",  44LL,  "-[NSString(VOTStringExtras) lineFromPosition:inDirection:]",  @"Unexpected text direction for getting line from position: %i");
  }
  id v7 = -[NSString ax_lineFromPosition:inDirection:](self, "ax_lineFromPosition:inDirection:", a3, a4 != 1);
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)wordFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTStringExtras.m",  50LL,  "-[NSString(VOTStringExtras) wordFromPosition:inDirection:]",  @"Unexpected text direction for getting line from position: %i");
  }
  id v7 = -[NSString ax_wordFromPosition:inDirection:](self, "ax_wordFromPosition:inDirection:", a3, a4 != 1);
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (id)wordStringFromPosition:(int64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2)
  {
    int64_t v10 = a4;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTStringExtras.m",  56LL,  "-[NSString(VOTStringExtras) wordStringFromPosition:inDirection:]",  @"Unexpected text direction for getting line from position: %i");
  }

  id v7 = -[NSString ax_wordFromPosition:inDirection:](self, "ax_wordFromPosition:inDirection:", a3, a4 != 1, v10);
  return -[NSString substringWithRange:](self, "substringWithRange:", v7, v8);
}

@end