@interface SSMutableURLRequestProperties
- (void)pb_configurePostRequestWithURL:(id)a3 data:(id)a4;
- (void)pb_configureRequestWithURL:(id)a3;
- (void)pb_setGUIDRequestParameterValue:(id)a3;
@end

@implementation SSMutableURLRequestProperties

- (void)pb_configureRequestWithURL:(id)a3
{
  id v4 = a3;
  -[SSMutableURLRequestProperties setCachePolicy:](self, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setURL:](self, "setURL:", v4);

  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( self,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
}

- (void)pb_configurePostRequestWithURL:(id)a3 data:(id)a4
{
  id v6 = a4;
  -[SSMutableURLRequestProperties pb_configureRequestWithURL:](self, "pb_configureRequestWithURL:", a3);
  -[SSMutableURLRequestProperties setHTTPBody:](self, "setHTTPBody:", v6);

  -[SSMutableURLRequestProperties setHTTPMethod:](self, "setHTTPMethod:", @"POST");
}

- (void)pb_setGUIDRequestParameterValue:(id)a3
{
}

@end