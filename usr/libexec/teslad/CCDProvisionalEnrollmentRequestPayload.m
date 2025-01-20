@interface CCDProvisionalEnrollmentRequestPayload
- (NSString)nonce;
- (id)action;
- (id)dictionary;
- (void)setNonce:(id)a3;
@end

@implementation CCDProvisionalEnrollmentRequestPayload

- (id)dictionary
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CCDProvisionalEnrollmentRequestPayload;
  v3 = -[CCDRequestPayload dictionary](&v8, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CCDProvisionalEnrollmentRequestPayload nonce](self, "nonce"));
  [v5 setObject:v6 forKeyedSubscript:@"nonce"];

  return v5;
}

- (id)action
{
  return @"RequestProvisionalEnrollment";
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
}

@end