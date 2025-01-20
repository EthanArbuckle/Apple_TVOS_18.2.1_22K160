@interface MediaSocialPostAttachment
- (NSString)assetToken;
- (NSString)assetTokenType;
- (double)uploadTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssetToken:(id)a3;
- (void)setAssetTokenType:(id)a3;
- (void)setUploadTime:(double)a3;
@end

@implementation MediaSocialPostAttachment

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MediaSocialPostAttachment;
  id v4 = -[MediaSocialPostAttachment copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setAssetToken:self->_assetToken];
  [v4 setAssetTokenType:self->_assetTokenType];
  [v4 setUploadTime:self->_uploadTime];
  return v4;
}

- (NSString)assetToken
{
  return self->_assetToken;
}

- (void)setAssetToken:(id)a3
{
}

- (NSString)assetTokenType
{
  return self->_assetTokenType;
}

- (void)setAssetTokenType:(id)a3
{
}

- (double)uploadTime
{
  return self->_uploadTime;
}

- (void)setUploadTime:(double)a3
{
  self->_uploadTime = a3;
}

- (void).cxx_destruct
{
}

@end