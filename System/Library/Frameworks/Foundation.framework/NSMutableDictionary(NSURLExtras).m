@interface NSMutableDictionary(NSURLExtras)
- (void)_web_setBool:()NSURLExtras forKey:;
- (void)_web_setInt:()NSURLExtras forKey:;
- (void)_web_setObject:()NSURLExtras forUncopiedKey:;
@end

@implementation NSMutableDictionary(NSURLExtras)

- (void)_web_setInt:()NSURLExtras forKey:
{
  v6 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", a3);
  [a1 setObject:v6 forKey:a4];
}

- (void)_web_setBool:()NSURLExtras forKey:
{
  v6 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", a3);
  [a1 setObject:v6 forKey:a4];
}

- (void)_web_setObject:()NSURLExtras forUncopiedKey:
{
}

@end