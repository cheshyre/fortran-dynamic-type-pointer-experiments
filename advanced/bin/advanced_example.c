#include "abc_cptr.h"
#include "derived_class1.h"
#include "derived_class2.h"

int main(void) {
    struct abstract_base_class_c_wrapper a;
    struct abstract_base_class_c_wrapper b;

    create_derived_class_1_instance(&a);
    create_derived_class_2_instance(&b);

    print_class_instance_using_c_wrapper(&a);
    print_class_instance_using_c_wrapper(&b);

    delete_derived_class_1_instance(&a);
    delete_derived_class_2_instance(&b);

    return 0;
}
