@interface OnScreenActionActivateUIElement
- (BOOL)_isValid;
- (void)_activateUIElementWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation OnScreenActionActivateUIElement

- (BOOL)_isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OnScreenActionActivateUIElement elementId](self, "elementId"));

  if (!v2)
  {
    v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_3650(v3);
    }
  }

  return v2 != 0LL;
}

- (void)_activateUIElementWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OnScreenActionActivateUIElement elementId](self, "elementId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  uint64_t v7 = PBSActivateScreenItemActionName;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_3418;
  v10[3] = &unk_40C0;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v6 performScreenActionWithName:v7 forItemIdentifier:v9 parameters:0 completion:v10];
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[OnScreenActionActivateUIElement _isValid](self, "_isValid")) {
    -[OnScreenActionActivateUIElement _activateUIElementWithCompletion:](self, "_activateUIElementWithCompletion:", v4);
  }
}

@end