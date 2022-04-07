module derived_class_1_module
    use, intrinsic :: iso_c_binding, only : c_loc, c_f_pointer, c_null_ptr

    use :: abc_module, only : abstract_base_class
    use :: wrapped_abc_module, only : wrapped_abstract_base_class
    use :: abc_cptr_module, only : abstract_base_class_c_wrapper

    implicit none

    private

    public :: derived_class_1

    public :: create_derived_class_1_instance
    public :: delete_derived_class_1_instance

    type, extends(abstract_base_class) :: derived_class_1
    contains
        procedure :: print_me => print_me_derived_1
    end type derived_class_1

    interface create_derived_class_1_instance
        module procedure create_derived_class_1_instance
    end interface create_derived_class_1_instance

    interface delete_derived_class_1_instance
        module procedure delete_derived_class_1_instance
    end interface delete_derived_class_1_instance

contains
    subroutine print_me_derived_1(this)
        class(derived_class_1), intent(in) :: this

        write(*,*) "PRINT_ME from DERIVED_CLASS_1"
    end subroutine print_me_derived_1

    subroutine create_derived_class_1_instance(instance_c_wrap) bind(c)
        type(abstract_base_class_c_wrapper), intent(out) :: instance_c_wrap
        type(derived_class_1), pointer :: instance_ptr
        type(wrapped_abstract_base_class), pointer :: wrapped_instance_ptr

        allocate(instance_ptr)
        allocate(wrapped_instance_ptr)
        wrapped_instance_ptr%ptr => instance_ptr

        instance_c_wrap%cptr_to_class = c_loc(wrapped_instance_ptr)
    end subroutine create_derived_class_1_instance

    subroutine delete_derived_class_1_instance(instance_c_wrap) bind(c)
        type(abstract_base_class_c_wrapper), intent(inout) :: instance_c_wrap
        ! type(derived_class_1), pointer :: instance_ptr
        type(wrapped_abstract_base_class), pointer :: wrapped_instance_ptr

        call c_f_pointer(instance_c_wrap%cptr_to_class, wrapped_instance_ptr)

        ! instance_ptr => wrapped_instance_ptr%ptr

        deallocate(wrapped_instance_ptr%ptr)
        deallocate(wrapped_instance_ptr)

        instance_c_wrap%cptr_to_class = c_null_ptr
    end subroutine delete_derived_class_1_instance

end module derived_class_1_module
