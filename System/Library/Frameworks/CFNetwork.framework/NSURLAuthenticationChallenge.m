@interface NSURLAuthenticationChallenge
+ (BOOL)supportsSecureCoding;
+ (id)_authenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4;
+ (id)_createAuthenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4;
- (NSError)error;
- (NSInteger)previousFailureCount;
- (NSURLAuthenticationChallenge)init;
- (NSURLAuthenticationChallenge)initWithAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge sender:(id)sender;
- (NSURLAuthenticationChallenge)initWithCoder:(id)a3;
- (NSURLAuthenticationChallenge)initWithProtectionSpace:(NSURLProtectionSpace *)space proposedCredential:(NSURLCredential *)credential previousFailureCount:(NSInteger)previousFailureCount failureResponse:(NSURLResponse *)response error:(NSError *)error sender:(id)sender;
- (NSURLCredential)proposedCredential;
- (NSURLProtectionSpace)protectionSpace;
- (NSURLResponse)failureResponse;
- (_CFURLAuthChallenge)_createCFAuthChallenge;
- (id)_initWithListOfProtectionSpaces:(id)a3 CurrentProtectionSpace:(id)a4 proposedCredential:(id)a5 previousFailureCount:(int64_t)a6 failureResponse:(id)a7 error:(id)a8 sender:(id)a9;
- (id)sender;
- (uint64_t)_initWithCFAuthChallenge:(uint64_t)a3 sender:;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation NSURLAuthenticationChallenge

- (NSURLAuthenticationChallenge)init
{
  return 0LL;
}

- (NSURLAuthenticationChallenge)initWithProtectionSpace:(NSURLProtectionSpace *)space proposedCredential:(NSURLCredential *)credential previousFailureCount:(NSInteger)previousFailureCount failureResponse:(NSURLResponse *)response error:(NSError *)error sender:(id)sender
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSURLAuthenticationChallenge;
  v14 = -[NSURLAuthenticationChallenge init](&v16, sel_init);
  if (v14) {
    v14->_internal = (NSURLAuthenticationChallengeInternal *)-[NSURLAuthenticationChallengeInternal initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]( objc_alloc(&OBJC_CLASS___NSURLAuthenticationChallengeInternal),  space,  credential,  previousFailureCount,  response,  error,  sender);
  }
  return v14;
}

- (id)_initWithListOfProtectionSpaces:(id)a3 CurrentProtectionSpace:(id)a4 proposedCredential:(id)a5 previousFailureCount:(int64_t)a6 failureResponse:(id)a7 error:(id)a8 sender:(id)a9
{
  v10 = -[NSURLAuthenticationChallenge initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]( self,  "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:",  a4,  a5,  a6,  a7,  a8,  a9);
  if (a3) {
    v10->_internal->protectionSpacesForChallenge = (NSArray *)[a3 copy];
  }
  return v10;
}

- (NSURLAuthenticationChallenge)initWithAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge sender:(id)sender
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSURLAuthenticationChallenge;
  v6 = -[NSURLAuthenticationChallenge init](&v8, sel_init);
  if (v6) {
    v6->_internal = (NSURLAuthenticationChallengeInternal *)-[NSURLAuthenticationChallengeInternal initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]( objc_alloc(&OBJC_CLASS___NSURLAuthenticationChallengeInternal),  -[NSURLAuthenticationChallenge protectionSpace]( challenge,  "protectionSpace"),  -[NSURLAuthenticationChallenge proposedCredential]( challenge,  "proposedCredential"),  -[NSURLAuthenticationChallenge previousFailureCount]( challenge,  "previousFailureCount"),  -[NSURLAuthenticationChallenge failureResponse]( challenge,  "failureResponse"),  -[NSURLAuthenticationChallenge error](challenge, "error"),  sender);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLAuthenticationChallenge;
  -[NSURLAuthenticationChallenge dealloc](&v3, sel_dealloc);
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_internal->space;
}

- (NSURLCredential)proposedCredential
{
  return self->_internal->proposedCredential;
}

- (NSInteger)previousFailureCount
{
  return self->_internal->previousFailureCount;
}

- (NSError)error
{
  return self->_internal->error;
}

- (NSURLResponse)failureResponse
{
  return self->_internal->failureResponse;
}

- (id)sender
{
  return self->_internal->sender;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = -[NSURLAuthenticationChallenge _createCFAuthChallenge](self, "_createCFAuthChallenge");
  if (v4)
  {
    v5 = v4;
    CFTypeRef cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if ((*(unsigned int (**)(void *, CFTypeRef *))(*((void *)v5 + 2) + 64LL))((void *)v5 + 2, &cf))
    {
      if (!cf)
      {
LABEL_17:
        CFRelease(v5);
        return;
      }

      CFTypeRef v6 = CFRetain(cf);
    }

    else
    {
      CFTypeRef v6 = 0LL;
    }

    if (cf) {
      CFRelease(cf);
    }
    if (v6)
    {
      if (objc_msgSend(a3, "requiresSecureCoding", &off_189C03828)
        && [a3 allowsKeyedCoding])
      {
        [a3 encodeObject:v6 forKey:@"__nsurlauthenticationchallenge_proto_plist"];
      }

      else
      {
        [a3 encodeObject:v6];
      }

      CFRelease(v6);
    }

    goto LABEL_17;
  }

- (NSURLAuthenticationChallenge)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding] && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v19 = (void *)MEMORY[0x189604010];
    uint64_t v18 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = (const void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v19,  "setWithObjects:",  v18,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  objc_opt_class(),  0),  @"__nsurlauthenticationchallenge_proto_plist");
  }

  else
  {
    v13 = (const void *)[a3 decodeObject];
  }

  if (!v13) {
    return 0LL;
  }
  uint64_t v14 = _CFURLAuthChallengeCreateFromArchive((const __CFAllocator *)*MEMORY[0x189604DB0], v13);
  if (!v14) {
    return 0LL;
  }
  v15 = (const void *)v14;
  objc_super v16 = (NSURLAuthenticationChallenge *)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:](self, v14, 0LL);
  CFRelease(v15);
  return v16;
}

- (uint64_t)_initWithCFAuthChallenge:(uint64_t)a3 sender:
{
  if (!a1) {
    return 0LL;
  }
  if (a2) {
    uint64_t v6 = (void *)(a2 + 16);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = (id)v6[3];
  if (v7)
  {
    id v7 =  -[NSURLProtectionSpace _initWithCFURLProtectionSpace:]( objc_alloc(&OBJC_CLASS___NSURLProtectionSpace),  "_initWithCFURLProtectionSpace:",  v7);
  }

  id v8 = (id)v6[4];
  if (v8)
  {
    id v8 =  -[NSURLCredential _initWithCFURLCredential:]( objc_alloc(&OBJC_CLASS___NSURLCredential),  "_initWithCFURLCredential:",  v8);
  }

  if (v6[6])
  {
    id v9 = +[NSURLResponse _responseWithCFURLResponse:](&OBJC_CLASS___NSURLResponse, "_responseWithCFURLResponse:");
  }

  else
  {
    id v9 = 0LL;
  }

  uint64_t v10 = [a1 _initWithListOfProtectionSpaces:v6[8] CurrentProtectionSpace:v7 proposedCredential:v8 previousFailureCount:v6[5] failureResponse:v9 error:v6[7] sender:a3];
  *(void *)(*(void *)(v10 + 8) + 64LL) = v6[9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSender:(id)a3
{
  sender = self->_internal->sender;
  if (sender != a3)
  {

    self->_internal->sender = (NSURLAuthenticationChallengeSender *)a3;
  }

- (_CFURLAuthChallenge)_createCFAuthChallenge
{
  internal = self->_internal;
  space = internal->space;
  if (space)
  {
    uint64_t v5 = -[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace");
    internal = self->_internal;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  proposedCredential = internal->proposedCredential;
  if (proposedCredential)
  {
    id v7 = -[NSURLCredential _cfurlcredential](proposedCredential, "_cfurlcredential");
    internal = self->_internal;
  }

  else
  {
    id v7 = 0LL;
  }

  failureResponse = internal->failureResponse;
  if (failureResponse)
  {
    id v9 = -[NSURLResponse _CFURLResponse](failureResponse, "_CFURLResponse");
    internal = self->_internal;
  }

  else
  {
    id v9 = 0LL;
  }

  uint64_t v10 = CFURLAuthChallengeCreate(0LL, v5, v7, internal->previousFailureCount, v9, internal->error);
  protectionSpacesForChallenge = self->_internal->protectionSpacesForChallenge;
  if (v10) {
    BOOL v12 = protectionSpacesForChallenge == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    URLAuthChallenge::setListOfProtectionSpaces((URLAuthChallenge *)(v10 + 16), protectionSpacesForChallenge);
  }

  uint64_t v13 = v10 + 16;
  if (!v10) {
    uint64_t v13 = 0LL;
  }
  *(void *)(v13 + 72) = self->_internal->preferredProtSpaceIndex;
  return (_CFURLAuthChallenge *)v10;
}

+ (id)_authenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4
{
  return (id)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:]( objc_alloc(&OBJC_CLASS___NSURLAuthenticationChallenge),  (uint64_t)a3,  (uint64_t)a4);
}

+ (id)_createAuthenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4
{
  return (id)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:]( objc_alloc(&OBJC_CLASS___NSURLAuthenticationChallenge),  (uint64_t)a3,  (uint64_t)a4);
}

@end