@interface NSOrderedChangesApply
@end

@implementation NSOrderedChangesApply

uint64_t ___NSOrderedChangesApply_block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  switch(a2)
  {
    case 2LL:
      result = [*(id *)(result + 32) insertObject:a5 atIndex:a4];
      break;
    case 3LL:
      result = [*(id *)(result + 32) removeObjectAtIndex:a4];
      break;
    case 4LL:
      result = [*(id *)(result + 32) replaceObjectAtIndex:a4 withObject:a5];
      break;
    case 5LL:
      result = objc_msgSend( *(id *)(result + 32),  "moveObjectsAtIndexes:toIndex:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:"),  a4);
      break;
    default:
      return result;
  }

  return result;
}

@end