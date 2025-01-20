@interface TVSettingsDisplayAssistantActionInfo
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (PBSDisplayAssistantPresentationRequest)presentationRequest;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPresentationRequest:(id)a3;
@end

@implementation TVSettingsDisplayAssistantActionInfo

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (PBSDisplayAssistantPresentationRequest)presentationRequest
{
  return self->_presentationRequest;
}

- (void)setPresentationRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end