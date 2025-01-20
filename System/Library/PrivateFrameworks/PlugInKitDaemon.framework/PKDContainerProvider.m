@interface PKDContainerProvider
- (char)create_or_lookup_path_for_current_user:(unint64_t)a3 identifier:(const char *)a4 create_if_necessary:(BOOL)a5 transient:(BOOL)a6 out_existed:(BOOL *)a7 out_error:(unint64_t *)a8;
@end

@implementation PKDContainerProvider

- (char)create_or_lookup_path_for_current_user:(unint64_t)a3 identifier:(const char *)a4 create_if_necessary:(BOOL)a5 transient:(BOOL)a6 out_existed:(BOOL *)a7 out_error:(unint64_t *)a8
{
  return (char *)container_create_or_lookup_path_for_current_user(a3, a4, a5, a6, a7, a8);
}

@end