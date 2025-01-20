@interface PBCriticalAlertContext
+ (id)contextWithViewController:(id)a3;
+ (id)thermalContext;
- (BOOL)expectsEventForwarding;
- (Class)viewControllerClass;
- (NSString)identifier;
- (PBCriticalAlertContext)initWithIdentifier:(id)a3 viewController:(id)a4;
- (PBCriticalAlertContext)initWithIdentifier:(id)a3 viewControllerClass:(Class)a4;
- (UIViewController)viewController;
- (void)setExpectsEventForwarding:(BOOL)a3;
@end

@implementation PBCriticalAlertContext

- (PBCriticalAlertContext)initWithIdentifier:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBCriticalAlertContext;
  v9 = -[PBCriticalAlertContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_viewController, a4);
  }

  return v10;
}

- (PBCriticalAlertContext)initWithIdentifier:(id)a3 viewControllerClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBCriticalAlertContext;
  id v8 = -[PBCriticalAlertContext init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    objc_storeStrong((id *)&v9->_viewControllerClass, a4);
  }

  return v9;
}

+ (id)contextWithViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v8 = [v5 initWithIdentifier:v7 viewController:v4];

  [v8 setExpectsEventForwarding:1];
  return v8;
}

+ (id)thermalContext
{
  return  [objc_alloc((Class)a1) initWithIdentifier:@"CritialAlert-Thermal" viewControllerClass:objc_opt_class(PBThermalWarningViewController)];
}

- (UIViewController)viewController
{
  viewController = self->_viewController;
  if (viewController) {
    v3 = viewController;
  }
  else {
    v3 = (UIViewController *)objc_alloc_init(self->_viewControllerClass);
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (BOOL)expectsEventForwarding
{
  return self->_expectsEventForwarding;
}

- (void)setExpectsEventForwarding:(BOOL)a3
{
  self->_expectsEventForwarding = a3;
}

- (void).cxx_destruct
{
}

@end