module abc_cptr_module
    use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer
    
    use :: wrapped_abc_module, only : wrapped_abstract_base_class

    implicit none

    private

    public :: abstract_base_class_c_wrapper
    public :: print_class_instance

    type, bind(c) :: abstract_base_class_c_wrapper
        type(c_ptr) :: cptr_to_class
    end type abstract_base_class_c_wrapper

    interface print_class_instance
        module procedure print_class_instance_using_c_wrapper
    end interface print_class_instance

contains

    subroutine print_class_instance_using_c_wrapper(class_instance) bind(c)
        type(abstract_base_class_c_wrapper), intent(in) :: class_instance
        type(wrapped_abstract_base_class), pointer :: wrapped_base_class_ptr

        call c_f_pointer(class_instance%cptr_to_class, wrapped_base_class_ptr)
        call wrapped_base_class_ptr%ptr%print_me()
    end subroutine print_class_instance_using_c_wrapper

end module abc_cptr_module
        