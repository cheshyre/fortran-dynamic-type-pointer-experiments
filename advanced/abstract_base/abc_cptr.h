#ifndef ADVANCED_ABSTRACT_BASE_ABC_CPTR_H_
#define ADVANCED_ABSTRACT_BASE_ABC_CPTR_H_

#ifdef __cplusplus
extern "C" {
#endif

struct abstract_base_class_c_wrapper {
  void* ptr_to_class;
};

void print_class_instance_using_c_wrapper(
    struct abstract_base_class_c_wrapper*);

#ifdef __cplusplus
}
#endif

#endif  // ADVANCED_ABSTRACT_BASE_ABC_CPTR_H_
