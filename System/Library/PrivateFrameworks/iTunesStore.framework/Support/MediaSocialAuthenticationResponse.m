@interface MediaSocialAuthenticationResponse
- (MediaSocialAuthenticationResponse)init;
- (NSNumber)accountIdentifier;
- (NSOrderedSet)postIdentifiers;
- (NSOrderedSet)uploadIdentifiers;
- (SSAuthenticateResponse)authenticateResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addPostIdentifier:(int64_t)a3;
- (void)addUploadIdentifier:(int64_t)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAuthenticateResponse:(id)a3;
- (void)setPostIdentifiers:(id)a3;
- (void)setUploadIdentifiers:(id)a3;
@end

@implementation MediaSocialAuthenticationResponse

- (MediaSocialAuthenticationResponse)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MediaSocialAuthenticationResponse;
  v2 = -[MediaSocialAuthenticationResponse init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    postIdentifiers = v2->_postIdentifiers;
    v2->_postIdentifiers = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    uploadIdentifiers = v2->_uploadIdentifiers;
    v2->_uploadIdentifiers = v5;
  }

  return v2;
}

- (void)addPostIdentifier:(int64_t)a3
{
  v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableOrderedSet addObject:](self->_postIdentifiers, "addObject:", v4);
}

- (void)addUploadIdentifier:(int64_t)a3
{
  v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableOrderedSet addObject:](self->_uploadIdentifiers, "addObject:", v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  [v4 setAccountIdentifier:self->_accountIdentifier];
  [v4 setAuthenticateResponse:self->_authenticateResponse];
  [v4 setPostIdentifiers:self->_postIdentifiers];
  [v4 setUploadIdentifiers:self->_uploadIdentifiers];
  return v4;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (SSAuthenticateResponse)authenticateResponse
{
  return self->_authenticateResponse;
}

- (void)setAuthenticateResponse:(id)a3
{
}

- (NSOrderedSet)postIdentifiers
{
  return &self->_postIdentifiers->super;
}

- (void)setPostIdentifiers:(id)a3
{
}

- (NSOrderedSet)uploadIdentifiers
{
  return &self->_uploadIdentifiers->super;
}

- (void)setUploadIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end