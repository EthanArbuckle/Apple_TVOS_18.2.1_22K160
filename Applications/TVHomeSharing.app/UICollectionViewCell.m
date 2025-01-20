@interface UICollectionViewCell
- (id)tvh_diffableDataSourceIdentifier;
- (void)tvh_setDiffableDataSourceIdentifier:(id)a3;
@end

@implementation UICollectionViewCell

- (void)tvh_setDiffableDataSourceIdentifier:(id)a3
{
}

- (id)tvh_diffableDataSourceIdentifier
{
  return objc_getAssociatedObject(self, "__MediaCategoryTypeIdentifier");
}

@end