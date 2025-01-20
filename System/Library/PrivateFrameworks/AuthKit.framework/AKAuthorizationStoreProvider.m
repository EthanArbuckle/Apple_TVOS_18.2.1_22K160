@interface AKAuthorizationStoreProvider
- (AKDataSeparatedContainerContext)sandboxContainerForPersona:(id)a3;
- (id)storeForAltDSID:(id)a3;
@end

@implementation AKAuthorizationStoreProvider

- (id)storeForAltDSID:(id)a3
{
  id v4 = a3;
  v5 = NSHomeDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 stringByAppendingString:@"/Library/Application Support/com.apple.akd/authorization.db"]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  unsigned int v9 = [v8 isDataSeparatedAccountForAltDSID:v4];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueStringForAltDSID:v4]);

  if (v11) {
    unsigned int v12 = v9;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v12 == 1)
  {
    id v13 = -[AKAuthorizationStoreProvider sandboxContainerForPersona:](self, "sandboxContainerForPersona:", v11);
    v15 = v13;
    if (v13 && (uint64_t v16 = v14) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingString:@"/com.apple.akd/authorization.db"]);
      v18 = -[AKDataSeparatedAuthorizationStore initWithContainerPath:withSandboxToken:]( objc_alloc(&OBJC_CLASS___AKDataSeparatedAuthorizationStore),  "initWithContainerPath:withSandboxToken:",  v17,  v16);
    }

    else
    {
      uint64_t v21 = _AKLogSiwa();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10012CE64(v22, v23, v24, v25, v26, v27, v28, v29);
      }

      v18 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = _AKLogSiwa();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      v32 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "DS:Creating store located at %@",  (uint8_t *)&v31,  0xCu);
    }

    v18 = -[AKAuthorizationStore initWithPath:](objc_alloc(&OBJC_CLASS___AKAuthorizationStore), "initWithPath:", v7);
  }

  return v18;
}

- (AKDataSeparatedContainerContext)sandboxContainerForPersona:(id)a3
{
  id v3 = a3;
  uint64_t v4 = container_query_create();
  container_query_set_class(v4, 10LL);
  container_query_operation_set_flags(v4, 0x900000001LL);
  id v5 = v3;
  container_query_set_persona_unique_string(v4, [v5 UTF8String]);
  uint64_t single_result = container_query_get_single_result(v4);
  if (!single_result)
  {
    uint64_t last_error = container_query_get_last_error(v4);
    unsigned int v9 = (void *)container_error_copy_unlocalized_description(last_error);
    uint64_t v14 = _AKLogSiwa();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10012CE94((uint64_t)v9, v15);
    }

    free(v9);
    goto LABEL_11;
  }

  uint64_t v7 = single_result;
  uint64_t v8 = container_copy_sandbox_token();
  if (!v8)
  {
    uint64_t v16 = _AKLogSiwa();
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_10012CF08((os_log_s *)v9, v17, v18, v19, v20, v21, v22, v23);
    }

LABEL_11:
    uint64_t v12 = 0LL;
    goto LABEL_12;
  }

  unsigned int v9 = (void *)v8;
  uint64_t path = container_get_path(v7);
  if (path)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  path,  1LL,  0LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 path]);
  }

  else
  {
    uint64_t v26 = _AKLogSiwa();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10012CF38(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    uint64_t v12 = 0LL;
  }

@end