@interface NSMutableURLRequest
- (void)setHTTPBody:(NSData *)HTTPBody;
- (void)setHTTPBodyStream:(NSInputStream *)HTTPBodyStream;
- (void)setHTTPMethod:(NSString *)HTTPMethod;
- (void)setHTTPShouldHandleCookies:(BOOL)HTTPShouldHandleCookies;
- (void)setURL:(NSURL *)URL;
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
@end

@implementation NSMutableURLRequest

- (void)setHTTPMethod:(NSString *)HTTPMethod
{
  if (!HTTPMethod && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }

  CFURLRequestSetHTTPRequestMethod(self, (const __CFString *)HTTPMethod);
}

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field
{
}

- (void)setURL:(NSURL *)URL
{
}

- (void)setHTTPShouldHandleCookies:(BOOL)HTTPShouldHandleCookies
{
  BOOL v3 = HTTPShouldHandleCookies;
  v4 = -[NSURLRequest _inner](self, "_inner");
  __int16 v5 = v4[32];
  __int16 v6 = v5 | 0x21;
  __int16 v7 = v5 & 0xFFDE | 0x20;
  if (v3) {
    __int16 v7 = v6;
  }
  v4[32] = v7;
}

- (void)setHTTPBody:(NSData *)HTTPBody
{
}

- (void)setHTTPBodyStream:(NSInputStream *)HTTPBodyStream
{
}

@end