@interface TVPiCloudPhotoSettings
- (BOOL)isDisplayingError;
- (BOOL)isMyPhotoStreamEnabled;
- (BOOL)isSharedPhotoStreamsEnabled;
- (BOOL)isUserAuthenticated;
- (BOOL)isiCloudPhotoLibraryEnabled;
- (void)resetAccountSettings;
- (void)setDisplayingError:(BOOL)a3;
- (void)setICloudPhotoLibraryEnabled:(BOOL)a3;
- (void)setMyPhotoStreamEnabled:(BOOL)a3;
- (void)setSharedPhotoStreamsEnabled:(BOOL)a3;
- (void)setUserAuthenticated:(BOOL)a3;
@end

@implementation TVPiCloudPhotoSettings

- (void)resetAccountSettings
{
}

- (BOOL)isUserAuthenticated
{
  return self->_userAuthenticated;
}

- (void)setUserAuthenticated:(BOOL)a3
{
  self->_userAuthenticated = a3;
}

- (BOOL)isiCloudPhotoLibraryEnabled
{
  return self->_iCloudPhotoLibraryEnabled;
}

- (void)setICloudPhotoLibraryEnabled:(BOOL)a3
{
  self->_iCloudPhotoLibraryEnabled = a3;
}

- (BOOL)isSharedPhotoStreamsEnabled
{
  return self->_sharedPhotoStreamsEnabled;
}

- (void)setSharedPhotoStreamsEnabled:(BOOL)a3
{
  self->_sharedPhotoStreamsEnabled = a3;
}

- (BOOL)isMyPhotoStreamEnabled
{
  return self->_myPhotoStreamEnabled;
}

- (void)setMyPhotoStreamEnabled:(BOOL)a3
{
  self->_myPhotoStreamEnabled = a3;
}

- (BOOL)isDisplayingError
{
  return self->_displayingError;
}

- (void)setDisplayingError:(BOOL)a3
{
  self->_displayingError = a3;
}

@end