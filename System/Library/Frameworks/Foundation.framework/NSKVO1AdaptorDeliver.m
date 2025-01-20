@interface NSKVO1AdaptorDeliver
@end

@implementation NSKVO1AdaptorDeliver

uint64_t ___NSKVO1AdaptorDeliver_block_invoke(uint64_t result, uint64_t a2)
{
  switch(*(void *)(result + 56))
  {
    case 1LL:
      result = objc_msgSend( *(id *)(result + 48),  "updateObject:atIndex:",  objc_msgSend( (id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(void *)(result + 40)),  "objectAtIndex:",  a2),  a2);
      break;
    case 2LL:
      result = objc_msgSend( *(id *)(result + 48),  "insertObject:atIndex:",  objc_msgSend( (id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(void *)(result + 40)),  "objectAtIndex:",  a2),  a2);
      break;
    case 3LL:
      result = [*(id *)(result + 48) removeObjectAtIndex:a2];
      break;
    case 4LL:
      result = objc_msgSend( *(id *)(result + 48),  "replaceObjectAtIndex:withObject:",  a2,  objc_msgSend( (id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(void *)(result + 40)),  "objectAtIndex:",  a2));
      break;
    default:
      return result;
  }

  return result;
}

@end