@interface AKFollowUpControllerServiceProviderImpl
- (id)serviceControllerForContext:(id)a3;
@end

@implementation AKFollowUpControllerServiceProviderImpl

- (id)serviceControllerForContext:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___AKFollowUpRequestProvider);
  v5 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v4,  "initWithContext:urlBagKey:",  v3,  AKURLBagKeyFetchFollowUps);

  v6 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v5);
  return v6;
}

@end