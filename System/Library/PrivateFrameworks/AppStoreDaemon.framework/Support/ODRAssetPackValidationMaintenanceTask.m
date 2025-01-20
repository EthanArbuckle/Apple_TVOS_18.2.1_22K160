@interface ODRAssetPackValidationMaintenanceTask
- (void)main;
@end

@implementation ODRAssetPackValidationMaintenanceTask

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(19LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Executing the Validate On Device Asset Packs Operation.",  (uint8_t *)&buf,  2u);
  }

  v5 = -[KeepAlive initWithName:]( objc_alloc(&OBJC_CLASS___KeepAlive),  "initWithName:",  @"com.apple.appstored.ODRAssetPackValidationMaintenanceOperation");
  if (self)
  {
    if (-[ODRAssetPackValidationMaintenanceTask isCancelled](self, "isCancelled"))
    {
      uint64_t v6 = ASDLogHandleForCategory(19LL);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "ValidateOnDeviceManifestsOperation has been cancelled.",  (uint8_t *)&buf,  2u);
      }

      uint64_t v8 = ASDErrorWithTitleAndMessage(@"_OnDemandResourcesErrorDomain", 900LL, 0LL, 0LL);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      -[Task completeWithError:](self, "completeWithError:", v9);
    }

    else
    {
      id v10 = sub_1002FE4E0((uint64_t)&OBJC_CLASS___ODRServiceDelegate);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)v11;
      if (v11) {
        v13 = *(void **)(v11 + 32);
      }
      else {
        v13 = 0LL;
      }
      id v9 = v13;

      if (v9)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v9,  1LL));
        id v25 = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 contentsOfDirectoryAtURL:v15 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v25]);
        id v17 = v25;
        if (v16)
        {
          *(void *)&__int128 buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472LL;
          v27 = sub_100225C78;
          v28 = &unk_1003ED678;
          v29 = self;
          id v30 = v14;
          sub_1002259F8((uint64_t)&OBJC_CLASS___ODRAssetPackValidationMaintenanceTask, v16, &buf);
          -[Task completeWithSuccess](self, "completeWithSuccess");
        }

        else
        {
          uint64_t v21 = ASDLogHandleForCategory(19LL);
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v17;
            _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Correctness checking the on-disk asset packs failed.  Error: %{public}@",  (uint8_t *)&buf,  0xCu);
          }

          uint64_t v23 = ASDErrorWithUnderlyingError(v17, @"_OnDemandResourcesErrorDomain", 900LL, 0LL, 0LL);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          -[Task completeWithError:](self, "completeWithError:", v24);
        }
      }

      else
      {
        uint64_t v18 = ASDLogHandleForCategory(19LL);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Path for asset packs is unset.",  (uint8_t *)&buf,  2u);
        }

        uint64_t v20 = ASDErrorWithTitleAndMessage(@"_OnDemandResourcesErrorDomain", 900LL, 0LL, 0LL);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
        -[Task completeWithError:](self, "completeWithError:", v14);
      }
    }
  }
}

@end