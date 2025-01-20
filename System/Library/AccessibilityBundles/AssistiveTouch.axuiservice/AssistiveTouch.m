}

void sub_1AD0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastShownAlertIdentifier]);
  [v2 hideAlertWithIdentifier:v3 forService:*(void *)(a1 + 32)];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastShownBannerIdentifier]);
  [v5 hideAlertWithIdentifier:v4 forService:*(void *)(a1 + 32)];
}

void HNDTestingSetLastFiredAction(id obj)
{
}

id HNDTestingLastFiredAction()
{
  return (id)qword_8D38;
}

BOOL HNDIsPhoneUserInterfaceIdiom()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

id HNDLocString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___HNDUIServer));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v1 value:&stru_4368 table:@"HNDUIServer"]);
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/HNDUIServer/source/HNDInterfaceUtilites.m",  25LL,  "NSString *HNDLocString(NSString *__strong)",  @"Received nil bundle for class HNDUIServer");
    id v5 = 0LL;
  }

  return v5;
}

id objc_msgSend_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}