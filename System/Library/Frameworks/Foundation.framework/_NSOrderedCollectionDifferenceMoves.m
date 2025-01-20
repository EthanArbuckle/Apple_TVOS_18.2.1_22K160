@interface _NSOrderedCollectionDifferenceMoves
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _NSOrderedCollectionDifferenceMoves

- (unint64_t)hash
{
  unint64_t result = -[NSMutableDictionary count](self->_removeDict, "count");
  if (result) {
    return objc_msgSend( (id)-[NSMutableDictionary objectForKeyedSubscript:]( self->_removeDict,  "objectForKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  self->_firstRemove)),  "hash");
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[NSMutableDictionary isEqual:](self->_removeDict, "isEqual:", *((void *)a3 + 1)))
  {
    return -[NSMutableDictionary isEqual:](self->_insertDict, "isEqual:", *((void *)a3 + 2));
  }

  else
  {
    return 0;
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSOrderedCollectionDifferenceMoves;
  -[_NSOrderedCollectionDifferenceMoves dealloc](&v3, sel_dealloc);
}

@end