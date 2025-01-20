@interface ODRMaintenanceTask
- (void)main;
@end

@implementation ODRMaintenanceTask

- (void)main
{
  v3 = objc_opt_new(&OBJC_CLASS___ODRManifestValidationMaintenanceTask);
  id v10 = 0LL;
  unsigned __int8 v4 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v3, &v10);
  id v5 = v10;

  if ((v4 & 1) != 0)
  {
    v6 = objc_opt_new(&OBJC_CLASS___ODRAssetPackValidationMaintenanceTask);
    id v9 = v5;
    unsigned __int8 v7 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v6, &v9);
    id v8 = v9;

    if ((v7 & 1) != 0) {
      -[Task completeWithSuccess](self, "completeWithSuccess");
    }
    else {
      -[Task completeWithError:](self, "completeWithError:", v8);
    }
    id v5 = v8;
  }

  else
  {
    -[Task completeWithError:](self, "completeWithError:", v5);
  }
}

@end