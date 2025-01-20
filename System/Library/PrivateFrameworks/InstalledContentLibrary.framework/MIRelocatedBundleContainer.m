@interface MIRelocatedBundleContainer
- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6;
- (BOOL)makeContainerLiveWithError:(id *)a3;
- (BOOL)purgeContentWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)shouldHaveCorrespondingDataContainer;
- (unint64_t)diskUsage;
@end

@implementation MIRelocatedBundleContainer

- (BOOL)makeContainerLiveWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a6) {
    *a6 = v8;
  }

  return 0;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (unint64_t)diskUsage
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MIContainer containerURL](self, "containerURL");
  unint64_t v5 = [v3 diskUsageForURL:v4];

  return v5;
}

- (BOOL)shouldHaveCorrespondingDataContainer
{
  return 0;
}

@end