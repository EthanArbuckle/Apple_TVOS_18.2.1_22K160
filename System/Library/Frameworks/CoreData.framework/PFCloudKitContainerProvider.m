@interface PFCloudKitContainerProvider
- (id)containerWithIdentifier:(id)a3;
- (id)containerWithIdentifier:(id)a3 options:(id)a4;
@end

@implementation PFCloudKitContainerProvider

- (id)containerWithIdentifier:(id)a3
{
  return (id)-[objc_class containerWithIdentifier:](getCloudKitCKContainerClass(), "containerWithIdentifier:", a3);
}

- (id)containerWithIdentifier:(id)a3 options:(id)a4
{
  id result = -[PFCloudKitContainerProvider containerWithIdentifier:](self, "containerWithIdentifier:", a3);
  if (result)
  {
    if (a4) {
      return (id)objc_msgSend( objc_alloc(getCloudKitCKContainerClass()),  "initWithContainerID:options:",  objc_msgSend(result, "containerID"),  a4);
    }
  }

  return result;
}

@end