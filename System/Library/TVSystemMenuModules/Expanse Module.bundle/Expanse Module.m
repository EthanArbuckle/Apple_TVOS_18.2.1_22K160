void sub_5798(id *a1, void *a2)
{
  id v2;
  id location[2];
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  [v2 presentDismissalAlertForCurrentActivitySession];

  [a1[4] dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0LL);
}

void sub_582C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  [v2 leaveSession];

  [a1[4] dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0LL);
}
}

_BYTE *sub_69A8(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_69C4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v25[1] = a1;
  v16 = (char *)[a1[4] state];
  if (v16 == (_BYTE *)&dword_0 + 2)
  {
    id v22 = &_os_log_default;
    char v21 = 1;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_INFO))
    {
      v7 = (os_log_s *)v22;
      os_log_type_t v8 = v21;
      id v9 = [a1[4] bundleID];
      id v20 = v9;
      sub_6D8C((uint64_t)v28, (uint64_t)v20);
      _os_log_impl(&dword_0, v7, v8, "Privacy setting button toggled, setting %@ to sharing automatically.", v28, 0xCu);

      objc_storeStrong(&v20, 0LL);
    }

    objc_storeStrong(&v22, 0LL);
    id v6 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    id v5 = [a1[4] bundleID];
    objc_msgSend(v6, "setSharingAutomaticallyForBundleID:");
  }

  else if (v16 == (_BYTE *)&dword_0 + 3)
  {
    v25[0] = &_os_log_default;
    char v24 = 1;
    if (os_log_type_enabled((os_log_t)v25[0], OS_LOG_TYPE_INFO))
    {
      log = (os_log_s *)v25[0];
      os_log_type_t type = v24;
      id v14 = [a1[4] bundleID];
      id v23 = v14;
      sub_6D8C((uint64_t)v29, (uint64_t)v23);
      _os_log_impl(&dword_0, log, type, "Privacy setting button toggled, setting %@ to ask before sharing.", v29, 0xCu);

      objc_storeStrong(&v23, 0LL);
    }

    objc_storeStrong(v25, 0LL);
    id v11 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    id v10 = [a1[4] bundleID];
    objc_msgSend(v11, "setAskBeforeSharingForBundleID:");
  }

  else
  {
    id v19 = &_os_log_default;
    char v18 = 17;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
    {
      id v2 = (os_log_s *)v19;
      os_log_type_t v3 = v18;
      id v4 = [a1[4] bundleID];
      id v17 = v4;
      sub_6DCC((uint64_t)v27, (uint64_t)v17, (uint64_t)[a1[4] state]);
      _os_log_fault_impl( &dword_0,  v2,  v3,  "Unexpected state - privacy setting button selected for %@ which has state %zd",  v27,  0x16u);

      objc_storeStrong(&v17, 0LL);
    }

    objc_storeStrong(&v19, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_6D8C(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_6DCC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_8730(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  unsigned __int8 v2 = objc_msgSend(location, "bs_containsObjectPassingTest:", &stru_10260);
  objc_storeStrong(&location, 0LL);
  return v2 & 1;
}

id sub_8A6C(uint64_t a1)
{
  os_log_type_t v3 = *(void **)(a1 + 32);
  unsigned __int8 v4 = 0;
  [v3 setHighlighted:v4 & 1];
  return [*(id *)(a1 + 32) updateStateAnimated:0];
}

void sub_8C54(id *a1)
{
  id v25[2] = a1;
  v25[1] = a1;
  objc_msgSend(*((id *)a1[4] + 5), "setControlState:animated:", objc_msgSend(a1[4], "state"), 0);
  [*((id *)a1[4] + 8) setText:*((void *)a1[4] + 1)];
  id v11 = (void *)*((void *)a1[4] + 9);
  uint64_t v12 = *((void *)a1[4] + 3);
  if (v12) {
    [v11 setText:v12];
  }
  else {
    [v11 setText:&stru_102F0];
  }
  [*((id *)a1[4] + 9) setHidden:*((void *)a1[4] + 3) == 0];
  os_log_type_t v8 = (void *)*((void *)a1[4] + 10);
  uint64_t v9 = *((void *)a1[4] + 4);
  if (v9) {
    [v8 setText:v9];
  }
  else {
    [v8 setText:&stru_102F0];
  }
  [*((id *)a1[4] + 10) setHidden:*((void *)a1[4] + 4) == 0];
  unsigned __int8 v1 = [a1[4] isFocused];
  char v23 = 0;
  char v21 = 0;
  if ((v1 & 1) != 0)
  {
    id v24 = [*((id *)a1[4] + 15) objectForKeyedSubscript:&off_10738];
    char v23 = 1;
    id v2 = v24;
  }

  else
  {
    id v22 = [*((id *)a1[4] + 15) objectForKeyedSubscript:&off_10720];
    char v21 = 1;
    id v2 = v22;
  }

  v25[0] = v2;
  if ((v21 & 1) != 0) {

  }
  if ((v23 & 1) != 0) {
  unsigned __int8 v3 = [a1[4] isFocused];
  }
  char v18 = 0;
  char v16 = 0;
  if ((v3 & 1) != 0)
  {
    id v19 = [*((id *)a1[4] + 16) objectForKeyedSubscript:&off_10738];
    char v18 = 1;
    id v4 = v19;
  }

  else
  {
    id v17 = [*((id *)a1[4] + 16) objectForKeyedSubscript:&off_10720];
    char v16 = 1;
    id v4 = v17;
  }

  id v20 = v4;
  if ((v16 & 1) != 0) {

  }
  if ((v18 & 1) != 0) {
  [*((id *)a1[4] + 8) setTextColor:v25[0]];
  }
  [*((id *)a1[4] + 9) setTextColor:v20];
  [*((id *)a1[4] + 10) setTextColor:v25[0]];
  id v5 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
  v15 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");

  id v14 =  +[UIImageSymbolConfiguration configurationWithHierarchicalColor:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithHierarchicalColor:",  v25[0]);
  id v13 =  -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v15,  "configurationByApplyingConfiguration:",  v14);
  id v6 = (void *)*((void *)a1[4] + 7);
  id v7 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  *((void *)a1[4] + 2),  v13);
  objc_msgSend(v6, "setImage:");

  [a1[4] layoutIfNeeded];
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v25, 0LL);
}

uint64_t sub_9220(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
}

BOOL sub_A1C8(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] type] == &dword_4;
  objc_storeStrong(location, 0LL);
  return v3;
}

id sub_A9E0()
{
  predicate = (dispatch_once_t *)&unk_155A0;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_102B0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_15598;
}

uint64_t sub_AA58(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

id sub_AD08()
{
  unsigned __int8 v1 = +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 100.0);
  os_log_type_t v8 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");

  id v4 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  v9[0] = v4;
  id v3 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
  v9[1] = v3;
  id v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL);
  id v7 =  +[UIImageSymbolConfiguration configurationWithPaletteColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPaletteColors:");

  id v6 =  -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v8,  "configurationByApplyingConfiguration:",  v7);
  id v5 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"shareplay",  v6);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

void sub_C6AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tvsystemmenuservice.expansemodule", "");
  id v2 = (void *)qword_15598;
  qword_15598 = (uint64_t)v1;
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}