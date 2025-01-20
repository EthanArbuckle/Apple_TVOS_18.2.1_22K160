@interface APSPerAppTokenMapEntry
- (APSTokenInfo)info;
- (BOOL)flag;
- (NSData)perAppToken;
- (id)description;
- (void)setFlag:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setPerAppToken:(id)a3;
@end

@implementation APSPerAppTokenMapEntry

- (id)description
{
  if (self->_flag) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ perAppToken = %@, info = %@, flag = %@ }",  self->_perAppToken,  self->_info,  v2);
}

- (NSData)perAppToken
{
  return self->_perAppToken;
}

- (void)setPerAppToken:(id)a3
{
}

- (APSTokenInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (BOOL)flag
{
  return self->_flag;
}

- (void)setFlag:(BOOL)a3
{
  self->_flag = a3;
}

- (void).cxx_destruct
{
}

@end