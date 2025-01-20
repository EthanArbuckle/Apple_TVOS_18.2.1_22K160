@interface NSObservationSink
+ (id)handleErrorsWithBlock:(id)a3;
+ (id)handleValuesWithBlock:(id)a3;
@end

@implementation NSObservationSink

+ (id)handleValuesWithBlock:(id)a3
{
  return  -[NSBlockObservationSink initWithBlock:tag:]( objc_alloc(&OBJC_CLASS___NSBlockObservationSink),  "initWithBlock:tag:",  a3,  1LL);
}

+ (id)handleErrorsWithBlock:(id)a3
{
  return  -[NSBlockObservationSink initWithBlock:tag:]( objc_alloc(&OBJC_CLASS___NSBlockObservationSink),  "initWithBlock:tag:",  a3,  2LL);
}

@end