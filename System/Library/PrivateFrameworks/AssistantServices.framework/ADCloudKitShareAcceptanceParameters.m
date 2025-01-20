@interface ADCloudKitShareAcceptanceParameters
- (ADCloudKitShareAcceptanceParameters)initWithURL:(id)a3 token:(id)a4 container:(id)a5 retryCount:(int64_t)a6;
- (CKDeviceToDeviceShareInvitationToken)token;
- (NSString)containerID;
- (NSURL)url;
- (int64_t)retryCount;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation ADCloudKitShareAcceptanceParameters

- (ADCloudKitShareAcceptanceParameters)initWithURL:(id)a3 token:(id)a4 container:(id)a5 retryCount:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADCloudKitShareAcceptanceParameters;
  v14 = -[ADCloudKitShareAcceptanceParameters init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    objc_storeStrong((id *)&v15->_token, a4);
    objc_storeStrong((id *)&v15->_containerID, a5);
    v15->_retryCount = a6;
  }

  return v15;
}

- (NSURL)url
{
  return self->_url;
}

- (CKDeviceToDeviceShareInvitationToken)token
{
  return self->_token;
}

- (NSString)containerID
{
  return self->_containerID;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
}

@end