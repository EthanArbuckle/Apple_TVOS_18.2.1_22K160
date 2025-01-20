@interface MIInstallableParallelPlaceholder
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)shouldModifyExistingContainers;
@end

@implementation MIInstallableParallelPlaceholder

- (BOOL)shouldModifyExistingContainers
{
  return 0;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"InstallingApplication", 60LL);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 parallelPlaceholderURL]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  [v8 removeItemAtURL:v7 error:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleURL]);
  id v30 = 0LL;
  unsigned __int8 v12 = [v9 moveItemAtURL:v11 toURL:v7 error:&v30];
  uint64_t v13 = (uint64_t)v30;

  if ((v12 & 1) == 0)
  {
    v23 = (void *)MIInstallerErrorDomain;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleURL]);
    id v26 = sub_1000130F4( (uint64_t)"-[MIInstallableParallelPlaceholder performInstallationWithError:]",  43LL,  v23,  20LL,  (void *)v13,  &off_10008A5E8,  @"Could not move %@ to %@",  v25,  (uint64_t)v24);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v26);

    LOBYTE(v13) = 0;
    goto LABEL_8;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundle]);
  -[MIInstallable setBundle:](self, "setBundle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  -[MIInstallableBundle setBundleContainer:](self, "setBundleContainer:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v29 = (id)v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 frameworkBundlesWithError:&v29]);
  id v19 = v29;

  -[MIInstallableBundle setFrameworkBundles:](self, "setFrameworkBundles:", v18);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));

  if (v13)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v28 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue([(id)v13 appExtensionBundlesWithError:&v28]);
    id v21 = v28;

    -[MIInstallableBundle setAppExtensionBundles:](self, "setAppExtensionBundles:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    LOBYTE(v13) = v22 != 0LL;
    id v19 = v21;
LABEL_8:
  }

  if (a3 && (v13 & 1) == 0) {
    *a3 = v19;
  }

  return v13;
}

@end