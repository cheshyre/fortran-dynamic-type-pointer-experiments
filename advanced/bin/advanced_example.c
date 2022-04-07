#include "abc_cptr.h"
#include "derived_class1.h"

int main(void) {
    struct abstract_base_class_c_wrapper a;

    create_derived_class_1_instance(&a);

    print_class_instance_using_c_wrapper(&a);

    delete_derived_class_1_instance(&a);

    return 0;
}
