@interface VMUCallTreePseudoNode
- (BOOL)isPseudo;
- (id)largestTopOfStackPath;
- (id)pseudoNodeTopOfStackChild;
- (id)sortedChildrenWithPseudoNode;
@end

@implementation VMUCallTreePseudoNode

- (BOOL)isPseudo
{
  return 1;
}

- (id)pseudoNodeTopOfStackChild
{
  return 0LL;
}

- (id)sortedChildrenWithPseudoNode
{
  return (id)[MEMORY[0x189603F18] array];
}

- (id)largestTopOfStackPath
{
  return (id)[MEMORY[0x189603F18] arrayWithObject:self];
}

@end