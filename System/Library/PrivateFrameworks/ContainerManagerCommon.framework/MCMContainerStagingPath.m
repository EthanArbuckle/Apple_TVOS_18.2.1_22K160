@interface MCMContainerStagingPath
+ (Class)_containerClassPathClass;
+ (id)stagingContainerPathForDestinationContainerPath:(id)a3 stagingPathIdentifier:(id)a4;
- (MCMContainerPath)destinationContainerPath;
- (void)setDestinationContainerPath:(id)a3;
@end

@implementation MCMContainerStagingPath

- (MCMContainerPath)destinationContainerPath
{
  return self->_destinationContainerPath;
}

- (void)setDestinationContainerPath:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

+ (id)stagingContainerPathForDestinationContainerPath:(id)a3 stagingPathIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 containerClassPath];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 userIdentity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MCMContainerPath containerPathForUserIdentity:containerClass:containerPathIdentifier:]( MCMContainerStagingPath,  "containerPathForUserIdentity:containerClass:containerPathIdentifier:",  v8,  [v7 containerClass],  v5);
  [v9 setDestinationContainerPath:v6];
  return v9;
}

@end