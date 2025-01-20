@interface NSObservationTransformer
+ (id)mapErrorsWithBlock:(id)a3;
+ (id)mapValuesWithBlock:(id)a3;
@end

@implementation NSObservationTransformer

+ (id)mapValuesWithBlock:(id)a3
{
  return  -[NSMapObservationTransformer initWithBlock:tag:]( objc_alloc(&OBJC_CLASS___NSMapObservationTransformer),  "initWithBlock:tag:",  a3,  1LL);
}

+ (id)mapErrorsWithBlock:(id)a3
{
  return  -[NSMapObservationTransformer initWithBlock:tag:]( objc_alloc(&OBJC_CLASS___NSMapObservationTransformer),  "initWithBlock:tag:",  a3,  2LL);
}

@end