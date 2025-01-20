void sub_10000508C(uint64_t a1)
{
  uint64_t v2;
  os_log_s *v3;
  v2 = sharingXPCHelperLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000089C4(a1, v3);
  }
}

void sub_1000050D4(uint64_t a1)
{
  uint64_t v2 = sharingXPCHelperLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ interrupted", (uint8_t *)&v5, 0xCu);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = sharingXPCHelperLog(*(void *)&argc, argv, envp);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SharingXPCHelper main", v8, 2u);
  }

  int v5 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v6 setDelegate:v5];
  [v6 resume];

  return 0;
}

void sub_1000066AC(_Unwind_Exception *a1)
{
}

void sub_1000066DC(uint64_t a1)
{
}

id sub_1000066E4(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 40),  "drawInRect:",  *(double *)(a1 + 80),  *(double *)(a1 + 88),  *(double *)(a1 + 96),  *(double *)(a1 + 104));
}

void sub_1000069EC(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commandBlock]);
  v1[2]();
}

SharingXPCHelperImageItem *sub_100006AD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 imageTitle]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _imageTitleData:v5 foregroundColor:*(void *)(a1 + 40)]);

  if (v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___SharingXPCHelperImageItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 imageTitle]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 cacheLookupKey]);
    v10 = -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:]( v7,  "initWithImageTitle:imageData:cacheLookupKey:",  v8,  v6,  v9);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

void sub_100006DEC(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commandBlock]);
  v1[2]();
}

void sub_1000070A8(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commandBlock]);
  v1[2]();
}

void sub_100007304(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commandBlock]);
  v1[2]();
}

void sub_100007558(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commandBlock]);
  v1[2]();
}

void sub_100007FFC(id a1)
{
  BOOL v1 = objc_opt_class(&OBJC_CLASS___CNAvatarImageRenderer)
    && objc_opt_class(&OBJC_CLASS___CNAvatarImageRendererSettings)
    && objc_opt_class(&OBJC_CLASS___CNMonogrammer) != 0;
  byte_100011938 = v1;
}

void sub_100008050( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100008940(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%@ shouldAcceptNewConnection: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000089C4(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ invalidated", (uint8_t *)&v3, 0xCu);
}

void sub_100008A3C(os_log_t log)
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "getting security scoped url for downloads directory is not supported on this platform!",  v1,  2u);
}

void sub_100008A7C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "### CallHandoff: Failed to write thumbnail to URL: %@\n",  (uint8_t *)&v2,  0xCu);
  sub_100008060();
}

void sub_100008AEC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008B50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008050( (void *)&_mh_execute_header,  a2,  a3,  "CGImgDataForUIActivityTitle: SFDataFromCGImage returned nil for %@",  a5,  a6,  a7,  a8,  2u);
  sub_100008060();
}

void sub_100008BB4(os_log_t log)
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Generating persepective data is currently only supported on native visionOS targets.",  v1,  2u);
}

id objc_msgSend__groupMonogramImageDataForContactsSync_style_diameter_monogramsAsFlatImages_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_groupMonogramImageDataForContactsSync:style:diameter:monogramsAsFlatImages:");
}

id objc_msgSend_drawingCommandsForMoreListEntryTitle_labelColor_hostConfig_activityCategory_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawingCommandsForMoreListEntryTitle:labelColor:hostConfig:activityCategory:");
}

id objc_msgSend_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawingCommandsForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNameWrapping:hostConfig:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}