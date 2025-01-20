void sub_4A08(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_CDF0;
  qword_CDF0 = (uint64_t)v1;
}

void sub_4CC4(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _overlayController]);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_4D68;
  v8 = &unk_8248;
  uint64_t v9 = v4;
  objc_msgSend(v2, "addContentViewController:withUserInteractionEnabled:forService:context:completion:", v3, 0);
}

void sub_4D68(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _overlayController]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_4DE0;
  v3[3] = &unk_8220;
  v3[4] = *(void *)(a1 + 32);
  [v2 fadeToBlackAndComeBack:v3 completion:1.0];
}

void sub_4DE0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemInvertColors sharedInstance](&OBJC_CLASS___AXSubsystemInvertColors, "sharedInstance"));
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemInvertColors identifier](&OBJC_CLASS___AXSubsystemInvertColors, "identifier"));
    uint64_t v5 = AXLoggerForFacility();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel(2LL);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog(2LL, @"Fading display to black complete");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, v7))
      {
        int v15 = 138543362;
        v16 = v11;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _overlayController]);
  [v12 removeContentViewController:v13 withUserInteractionEnabled:0 forService:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "set_overlayController:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIServiceManager sharedServiceManager](&OBJC_CLASS___AXUIServiceManager, "sharedServiceManager"));
  [v14 endTransactionWithIdentifier:@"SmartInvertDisplay" forService:*(void *)(a1 + 32)];
}

void sub_554C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _filterView]);
  [v1 setAlpha:1.0];
}

void sub_5580(uint64_t a1)
{
  double v1 = *(double *)(a1 + 48);
  double v2 = (v1 + v1) * 0.25;
  double v3 = v1 * 0.25;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_5640;
  v7[3] = &unk_8220;
  uint64_t v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5674;
  v5[3] = &unk_8270;
  id v6 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v7,  v5,  v2,  v3);
}

void sub_5640(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _filterView]);
  [v1 setAlpha:0.0];
}

uint64_t sub_5674(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_context_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:context:completion:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}